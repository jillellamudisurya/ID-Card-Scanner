import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idcardscanner/user.dart';
import 'package:idcardscanner/auth.dart';

class DatabaseService {
  String uid;

  getDate() {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    return "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  }

  Future outing(String scan, String state) async {
    final CollectionReference outingOut =
        Firestore.instance.collection(getDate());
    User user = await AuthService().user.first;
    return await outingOut
        .document('Outing')
        .collection(state)
        .document()
        .setData({
      'Scanned By': user.uid,
      'Scanned': scan,
      'OutTime': new DateTime.now().toString()
    });
  }

  Future leave(String scan, String state) async {
    final CollectionReference outingOut =
        Firestore.instance.collection(getDate());
    User user = await AuthService().user.first;
    return await outingOut
        .document('Leave')
        .collection(state)
        .document()
        .setData({
      'Scanned By': user.uid,
      'Scanned': scan,
      'OutTime': new DateTime.now().toString()
    });
  }
}
