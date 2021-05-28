import 'package:cloud_firestore/cloud_firestore.dart';

class CheckAdmin {
  Future<bool> isAdmin(String id) async {
    DocumentSnapshot snap =
        await Firestore.instance.collection('Admins').document(id).get();
    if (snap == null || !snap.exists) {
      return false;
    }
    return true;
  }
}
