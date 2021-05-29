import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:idcardscanner/misc/user.dart';
import 'package:idcardscanner/services/auth.dart';

class DatabaseService {
  _getDate() {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    return "${dateParse.day}-${dateParse.month}-${dateParse.year}";
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
    var dateTime = DateTime.now();
    var timeNow =
        "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}:${dateTime.second.ceil()}";
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
        'Intime': 'NOT RETURNED',
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
        if (collecSnap.data['Intime'] == 'NOT RETURNED') {
          collec.updateData({'Intime': timeNow});
          return 1;
        }
        return 0;
      }
      var date = DateTime.now().subtract(Duration(days: 1));
      String yesterday = "${date.day}-${date.month}-${date.year}";
      final CollectionReference yesterdayOut =
          Firestore.instance.collection(yesterday);
      var coll = yesterdayOut
          .document('Outing')
          .collection('Out')
          .document(snap.data['id']);
      DocumentSnapshot collSnap = await coll.get();
      if (collSnap.exists) {
        if (collSnap.data['Intime'] == 'NOT RETURNED') {
          coll.updateData({'Intime': timeNow});
          return 1;
        }
        return 0;
      }
      return 0;
    }
  }

  Future<int> leave(String scan, String state) async {
    final CollectionReference leaveOut =
        Firestore.instance.collection(_getDate());
    DocumentSnapshot snap =
        await Firestore.instance.collection('Students_Ph').document(scan).get();
    if (snap == null || !snap.exists) {
      return -1;
    }
    User user = await AuthService().user.first;
    DocumentSnapshot snap2 = await Firestore.instance
        .collection('Security')
        .document(user.uid)
        .get();
    var dateTime = DateTime.now();
    var timeNow =
        "${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}:${dateTime.second.ceil()}";

    var collec =
        leaveOut.document('Leave').collection(state).document(snap.data['id']);
    DocumentSnapshot collecSnap = await collec.get();
    if (!(collecSnap == null || !collecSnap.exists)) {
      return 0;
    }
    collec.setData({
      'Scanned': snap.data['name'],
      'OutTime': timeNow,
      'Scanned By Name': snap2.data['name']
    });
    return 1;
  }

  Stream<QuerySnapshot> get stud {
    final CollectionReference sample = Firestore.instance
        .collection(_getDate())
        .document("Outing")
        .collection("Out");
    return sample.snapshots();
  }
}
