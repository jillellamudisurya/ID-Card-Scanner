import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    final CollectionReference outingOut =
        Firestore.instance.collection(_getDate());
    DocumentSnapshot snap =
        await Firestore.instance.collection('Students_Ph').document(scan).get();
    if (snap == null || !snap.exists) {
      return -1;
    }
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var timeNow = _getTime();
    if (state == 'Out') {
      var collec = outingOut
          .document('Outing')
          .collection(state)
          .document(snap.data['id']);
      DocumentSnapshot collecSnap = await collec.get();
      if (!(collecSnap == null || !collecSnap.exists)) {
        return 0;
      }
      collec.setData({
        'Name': snap.data['name'],
        'OutTime': timeNow,
        'InTime': 'NOT RETURNED',
        'ScannedBy': user.displayName,
      });
      return 1;
    } else {
      var collec = outingOut
          .document('Outing')
          .collection('Out')
          .document(snap.data['id']);
      DocumentSnapshot collecSnap = await collec.get();
      if (collecSnap.exists) {
        if (collecSnap.data['InTime'] == 'NOT RETURNED') {
          collec.updateData({'InTime': timeNow});
          return 1;
        }
        return 0;
      }
      String yesterday = _getYesterday();
      final CollectionReference yesterdayOut =
          Firestore.instance.collection(yesterday);
      var coll = yesterdayOut
          .document('Outing')
          .collection('Out')
          .document(snap.data['id']);
      DocumentSnapshot collSnap = await coll.get();
      if (collSnap.exists) {
        if (collSnap.data['InTime'] == 'NOT RETURNED') {
          coll.updateData({'InTime': timeNow});
          return 1;
        }
        return 0;
      }
      return 0;
    }
  }

  Future<int> leave(String scan, String state) async {
    DocumentSnapshot snap =
        await Firestore.instance.collection('Students_Ph').document(scan).get();
    if (snap == null || !snap.exists) {
      return -1;
    }
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var timeNow = _getTime();
    // var collec =
    //     leaveOut.document('Leave').collection(state).document(snap.data['id']);
    // DocumentSnapshot collecSnap = await collec.get();
    // if (!(collecSnap == null || !collecSnap.exists)) {
    //   return 0;
    // }
    // collec.setData({
    //   'Scanned': snap.data['name'],
    //   'OutTime': timeNow,
    //   'Scanned By Name': user.displayName
    // });
    // return 1;
    final CollectionReference leaveOut = Firestore.instance.collection('Leave');

    DocumentSnapshot snapshot = await leaveOut.document(snap.data['id']).get();
    if (state == "Out") {
      if (!snapshot.exists) {
        leaveOut.document(snap.data['id']).setData({
          'OutTime': timeNow,
          'InTime': 'NOT RETURNED',
          'ScannedBy': user.displayName,
          'name': snap.data['name'],
          'isOut': true
        });
        return 1;
      } else if (snapshot.data['isOut'] == false) {
        leaveOut.document(snap.data['id']).updateData({
          'OutTime': timeNow,
          'InTime': 'NOT RETURNED',
          'ScannedBy': user.displayName,
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
            'ScannedBy': user.displayName,
            'isOut': false
          });
          return 1;
        }
      }
      return 0;
    }
  }

  Stream<QuerySnapshot> stud(String date) {
    final CollectionReference sample = Firestore.instance
        .collection(date)
        .document("Outing")
        .collection("Out");
    return sample.snapshots();
  }

  Stream<QuerySnapshot> get leaveDB {
    final CollectionReference leaves = Firestore.instance.collection('Leave');
    return leaves.snapshots();
  }
}
