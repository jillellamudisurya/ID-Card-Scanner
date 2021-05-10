import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _userFromFB(FirebaseUser user) {
    return user != null ? user.uid : null;
  }

  Stream<String> get user {
    return _auth.onAuthStateChanged.map(_userFromFB);
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future signIn(String mail, String pswd) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: mail, password: pswd);
      FirebaseUser user = result.user;
      return user.uid;
    } catch (e) {
      return null;
    }
  }
}
