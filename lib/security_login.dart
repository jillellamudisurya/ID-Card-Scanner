import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idcardscanner/security_success.dart';
import 'package:idcardscanner/auth.dart';
import 'package:idcardscanner/error.dart';

class Seclogin extends StatefulWidget {
  @override
  _SecloginState createState() => _SecloginState();
}

class _SecloginState extends State<Seclogin> {
  final AuthService _auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();

  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 30.0),
          Center(
              child: Text(
            'SECURITY LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
          )),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Form(
                key: formkey,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (String name) {
                    if (name.isEmpty) {
                      return "Required *";
                    } else {
                      email = name;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter Name',
                      hintText: 'enter your name',
                      filled: true,
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formkey1,
              child: TextFormField(
                validator: (String pswd) {
                  if (pswd.isEmpty) {
                    return "Required *";
                  } else {
                    password = pswd;
                  }
                },
                keyboardType: TextInputType.name,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Enter Password',
                    hintText: 'enter your password',
                    filled: true,
                    fillColor: Colors.grey,
                    suffixIcon: InkWell(
                        child: Icon(
                      Icons.visibility,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )),
              ),
            ),
          ),
          Center(
            child: RaisedButton.icon(
              onPressed: () async {
                if (formkey.currentState.validate() &&
                    formkey1.currentState.validate()) {
                  dynamic result = await _auth.signIn(email, password);
                  if ((result != null) &&
                      !(result == '6V3TnlrRYxapw5HGOIqF14hG9tV2' ||
                          result == 'AnfgPz6iHJPJZvFY0QPDaX42vG12')) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Secsuccess()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Error()));
                  }
                }
              },
              icon: Icon(
                Icons.login_sharp,
              ),
              label: Text('Login'),
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
