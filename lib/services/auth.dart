import 'package:firebase_auth/firebase_auth.dart';
import 'package:idcardscanner/misc/checkAdmin.dart';
import 'package:idcardscanner/misc/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFB(FirebaseUser user) {
    return user != null
        ? new User(uid: user.uid, name: user.displayName)
        : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFB);
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future signIn(String mail, String pswd, bool isAdmin) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: mail, password: pswd);
      FirebaseUser user = result.user;
      bool adm = await CheckAdmin().isAdmin(user.uid);
      if ((isAdmin == true && adm == false) ||
          (isAdmin == false && adm == true)) {
        signout();
      }
      return user.uid;
    } catch (e) {
      return null;
    }
  }
}
