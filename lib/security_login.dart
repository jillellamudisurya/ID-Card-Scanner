import 'package:flutter/material.dart';
import 'package:idcardscanner/login_alert.dart';
import 'package:idcardscanner/auth.dart';
import 'package:idcardscanner/checkAdmin.dart';
import 'package:idcardscanner/loading.dart';

class Seclogin extends StatefulWidget {
  @override
  _SecloginState createState() => _SecloginState();
}

class _SecloginState extends State<Seclogin> {
  final AuthService _auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
  String email = '', password = '';
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return isLoad
        ? Loading()
        : Scaffold(
            //backgroundColor: Colors.grey[850],
            appBar: AppBar(
              title: Text('ID Card Scanner'),
              backgroundColor: Colors.grey[900],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [Colors.black, Colors.grey, Colors.black])),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60),
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60))),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(225, 95, 27, 13),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: Form(
                                      key: formkey,
                                      child: TextFormField(
                                        validator: (String name) {
                                          if (name.isEmpty) {
                                            return "Required *";
                                          } else {
                                            email = name;
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Enter Your Name',
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: Form(
                                      key: formkey1,
                                      child: TextFormField(
                                        obscureText: true,
                                        validator: (String name) {
                                          if (name.isEmpty) {
                                            return "Required *";
                                          } else {
                                            password = name;
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText: 'Enter Your Password',
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  if (formkey.currentState.validate() &&
                                      formkey1.currentState.validate()) {
                                    setState(() {
                                      isLoad = true;
                                    });
                                    dynamic result =
                                        await _auth.signIn(email, password);

                                    if ((result != null) &&
                                        !CheckAdmin().isAdmin(result)) {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => Secsuccess()));

                                      Navigator.pop(context);
                                    } else {
                                      // Navigator.push(
                                      //   context,
                                      // MaterialPageRoute(
                                      //   builder: (context) => Error()));

                                      setState(() {
                                        isLoad = false;
                                      });
                                      await AlertDialogs.okDialog(
                                          context,
                                          'Incorrect Details',
                                          'Enter valid Details');
                                    }
                                  }
                                },
                                icon: Icon(
                                  Icons.login,
                                ),
                                label: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
          );
  }
}
