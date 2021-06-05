import 'package:flutter/material.dart';
import 'package:idcardscanner/errors/login_alert.dart';
import 'package:idcardscanner/misc/input_widget.dart';
import 'package:idcardscanner/misc/button_widget.dart';
import 'package:idcardscanner/misc/loading.dart';
import 'package:idcardscanner/services/database.dart';

// ignore: must_be_immutable
class AddToDB extends StatefulWidget {
  @override
  _AddToDBState createState() => _AddToDBState();
}

class _AddToDBState extends State<AddToDB> {
  String fname = "";
  String id = "";
  String dob = "";
  String emergencyNumber = "";
  String blood = "";
  String address = "";
  String adhaar = "";
  String classR = "";
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return isLoad
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff34456e),
              elevation: 0,
              centerTitle: true,
              title: Text("Add To DB"),
            ),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else {
                          fname = name;
                          return null;
                        }
                      },
                      labelText: "Full Name",
                      icon: Icons.account_circle_rounded,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else if (name.length != 7 ||
                            name[0].toLowerCase() != 's' ||
                            !name.substring(1).contains(RegExp(r'[0-9]{6}'))) {
                          return "Not valid ID";
                        } else {
                          id = name;
                          return null;
                        }
                      },
                      labelText: "ID Number",
                      icon: Icons.account_circle_outlined,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else {
                          classR = name;
                          return null;
                        }
                      },
                      labelText: "Class",
                      icon: Icons.location_on_outlined,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else {
                          dob = name;
                          return null;
                        }
                      },
                      labelText: "Date Of Birth",
                      icon: Icons.date_range,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else if (name.length != 10) {
                          return "Not valid Number";
                        } else {
                          emergencyNumber = name;
                          return null;
                        }
                      },
                      labelText: "Emergency Number",
                      icon: Icons.phone,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else {
                          blood = name;
                          return null;
                        }
                      },
                      labelText: "Blood Group",
                      icon: Icons.local_hospital_outlined,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isEmpty) {
                          return "Required *";
                        } else {
                          address = name;
                          return null;
                        }
                      },
                      labelText: "Address",
                      icon: Icons.location_city_outlined,
                    ),
                    SizedBox(height: 10),
                    Input(
                      validator: (String name) {
                        if (name.isNotEmpty) {
                          if (name.length != 12 &&
                              !name.contains(RegExp(r'[0-9]{12}'))) {
                            return "aadhar is only 12 digtts";
                          } else {
                            adhaar = name;
                            return null;
                          }
                        } else {
                          adhaar = name;
                          return null;
                        }
                      },
                      labelText: "Aadhaar Number",
                      icon: Icons.lock_outlined,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Enter Aadhaar only if your ID card's bar code has aadhaar number in it.We don't need your aadhaar in any other case.",
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 50,
                        width: double.infinity,
                        child: ButtonWidget(
                            text: "SUBMIT",
                            onClicked: () async {
                              setState(() {
                                isLoad = true;
                              });
                              bool res = await DatabaseService().addStudent(
                                  fname,
                                  id,
                                  dob,
                                  emergencyNumber,
                                  blood,
                                  address,
                                  adhaar,
                                  classR);
                              setState(() {
                                isLoad = false;
                              });
                              if (res) {
                                await AlertDialogs.okDialog(context, 'Success',
                                    'Your data will be verified by Database Team and then added shortly');
                                Navigator.pop(context);
                              } else {
                                await AlertDialogs.okDialog(
                                    context, 'Failed', 'Try again!!!');
                                Navigator.pop(context);
                              }
                            })),
                  ],
                ),
              ),
            ),
          );
  }
}
