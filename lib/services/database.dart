import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:idcardscanner/misc/user.dart';

class DatabaseService {
  _getDate() {
    var date = new DateTime.now();
    return date.day.toString().padLeft(2, '0') +
        "-" +
        date.month.toString().padLeft(2, "0") +
        "-" +
        date.year.toString();
  }

  _getYesterday() {
    var date = DateTime.now().subtract(Duration(days: 1));
    return date.day.toString().padLeft(2, '0') +
        "-" +
        date.month.toString().padLeft(2, "0") +
        "-" +
        date.year.toString();
  }

  _getTime() {
    var dateTime = DateTime.now();
    var timeNow = dateTime.day.toString().padLeft(2, "0") +
        "-" +
        dateTime.month.toString().padLeft(2, "0") +
        "-" +
        dateTime.year.toString() +
        " " +
        dateTime.hour.toString().padLeft(2, "0") +
        ":" +
        dateTime.minute.toString().padLeft(2, "0") +
        ":" +
        dateTime.second.toString().padLeft(2, "0");
    return timeNow;
  }

  Future<int> outing(String scan, String state) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    QuerySnapshot studDbPhn = await Firestore.instance
        .collection('Students')
        .where('emergenceyNumber', isEqualTo: scan)
        .getDocuments();
    QuerySnapshot studDbAadhar = await Firestore.instance
        .collection('Students')
        .where('aadhar', isEqualTo: scan)
        .getDocuments();
    if (studDbPhn.documents.length == 0 && studDbAadhar.documents.length == 0) {
      Firestore.instance.collection('randomScan').document().setData(
          {'scanned': scan, 'time': _getTime(), 'loggedIn': user.displayName});
      return -1;
    }
    DocumentSnapshot snap;
    if (studDbPhn.documents.length == 1) {
      snap = studDbPhn.documents.first;
    } else if (studDbAadhar.documents.length == 1) {
      snap = studDbAadhar.documents.first;
    } else {
      return 2;
    }
    final CollectionReference outingOut =
        Firestore.instance.collection(_getDate());
    var timeNow = _getTime();
    if (state == 'Out') {
      var collec = outingOut.document(snap.data['id']);
      DocumentSnapshot collecSnap = await collec.get();
      if (!(collecSnap == null || !collecSnap.exists)) {
        return 0;
      }
      collec.setData({
        'Name': snap.data['name'],
        'OutTime': timeNow,
        'InTime': 'NOT RETURNED',
        'InScannedBy': ' ',
        'OutScannedBy': user.displayName,
      });
      return 1;
    } else {
      var collec = outingOut.document(snap.data['id']);
      DocumentSnapshot collecSnap = await collec.get();
      if (collecSnap.exists) {
        if (collecSnap.data['InTime'] == 'NOT RETURNED') {
          collec.updateData({
            'InTime': timeNow,
            'InScannedBy': user.displayName,
          });
          return 1;
        }
        return 0;
      }
      String yesterday = _getYesterday();
      final CollectionReference yesterdayOut =
          Firestore.instance.collection(yesterday);
      var coll = yesterdayOut.document(snap.data['id']);
      DocumentSnapshot collSnap = await coll.get();
      if (collSnap.exists) {
        if (collSnap.data['InTime'] == 'NOT RETURNED') {
          coll.updateData({
            'InTime': timeNow,
            'InScannedBy': user.displayName,
          });
          return 1;
        }
      }
      return 0;
    }
  }

  Future<int> leave(String scan, String state) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    QuerySnapshot studDbPhn = await Firestore.instance
        .collection('Students')
        .where('emergenceyNumber', isEqualTo: scan)
        .getDocuments();
    QuerySnapshot studDbAadhar = await Firestore.instance
        .collection('Students')
        .where('aadhar', isEqualTo: scan)
        .getDocuments();
    if (studDbPhn.documents.length == 0 && studDbAadhar.documents.length == 0) {
      Firestore.instance.collection('randomScan').document().setData(
          {'scanned': scan, 'time': _getTime(), 'loggedIn': user.displayName});
      return -1;
    }
    DocumentSnapshot snap;
    if (studDbPhn.documents.length == 1) {
      snap = studDbPhn.documents.first;
    } else if (studDbAadhar.documents.length == 1) {
      snap = studDbAadhar.documents.first;
    } else {
      return 2;
    }
    var timeNow = _getTime();
    final CollectionReference leaveOut = Firestore.instance.collection('Leave');

    DocumentSnapshot snapshot = await leaveOut.document(snap.data['id']).get();
    if (state == "Out") {
      if (!snapshot.exists) {
        leaveOut.document(snap.data['id']).setData({
          'OutTime': timeNow,
          'InTime': 'NOT RETURNED',
          'InScannedBy': ' ',
          'OutScannedBy': user.displayName,
          'name': snap.data['name'],
          'isOut': true
        });
        return 1;
      } else if (snapshot.data['isOut'] == false) {
        leaveOut.document(snap.data['id']).updateData({
          'OutTime': timeNow,
          'InTime': 'NOT RETURNED',
          'InScannedBy': ' ',
          'OutScannedBy': user.displayName,
          'isOut': true
        });
        return 1;
      }
      return 0;
    } else {
      if (snapshot.exists) {
        if (snapshot.data['isOut'] == true) {
          leaveOut.document(snap.data['id']).updateData({
            'InTime': timeNow,
            'InScannedBy': user.displayName,
            'isOut': false
          });
          return 1;
        }
      }
      return 0;
    }
  }

  Stream<QuerySnapshot> stud(String date) {
    final CollectionReference sample = Firestore.instance.collection(date);
    return sample.snapshots();
  }

  Stream<QuerySnapshot> get leaveDB {
    final CollectionReference leaves = Firestore.instance.collection('Leave');
    return leaves.snapshots();
  }

  Future<Stats> todayCount() async {
    int totalStudents = await Firestore.instance
        .collection('Students')
        .getDocuments()
        .then((value) => value.documents.length);
    int totalTodayOut = await Firestore.instance
        .collection(_getDate())
        .getDocuments()
        .then((value) => value.documents.length);
    int todayOut = await Firestore.instance
        .collection(_getDate())
        .where('InTime', isEqualTo: "NOT RETURNED")
        .getDocuments()
        .then((value) => value.documents.length);
    int leaveCount = await Firestore.instance
        .collection('Leave')
        .where('isOut', isEqualTo: true)
        .getDocuments()
        .then((value) => value.documents.length);

    return Stats(
        students: totalStudents,
        totalOut: totalTodayOut,
        out: todayOut,
        leave: leaveCount);
  }

  Future<bool> addStudent(
      String fname,
      String id,
      String dob,
      String emergencyNumber,
      String blood,
      String address,
      String adhaar,
      String classR) async {
    try {
      if (fname.length == 0 ||
          id.length == 0 ||
          classR.length == 0 ||
          emergencyNumber.length == 0 ||
          adhaar.length == 0 ||
          dob.length == 0 ||
          blood.length == 0 ||
          address.length == 0) {
        return false;
      }
      final CollectionReference outsider =
          Firestore.instance.collection('Outsider');
      await outsider.document(id.toUpperCase()).setData({
        'id': id.toUpperCase(),
        'name': fname,
        'class': classR,
        'emergenceyNumber': emergencyNumber,
        'aadhar': adhaar,
        'dob': dob,
        'blood': blood,
        'address': address
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
