import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idcardscanner/error.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
