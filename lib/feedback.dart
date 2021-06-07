import 'package:flutter/material.dart';
//import 'package:idcardscanner/misc/button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff34456e),
        elevation: 0,
        centerTitle: true,
        title: Text("ID card Scanner"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/BG.png"), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              Text(
                "FEEDBACK",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
              SizedBox(height: 30),
              Theme(
                child: Form(
                  key: formkey,
                  child: TextFormField(
                    maxLines: 5,
                    validator: (String name) {
                      if (name.isEmpty) {
                        return "Required *";
                      } else {
                        msg = name;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.feedback,
                      ),
                      labelText: "FEEDBACK",
                      labelStyle:
                          TextStyle(fontSize: 16, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff34456e),
                          )),
                    ),
                  ),
                ),
                data:
                    Theme.of(context).copyWith(primaryColor: Color(0xff34456e)),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    if (formkey.currentState.validate()) {
                      Firestore.instance
                          .collection('Feedback')
                          .document()
                          .setData({
                        'message': msg,
                        'time': DateTime.now().toString()
                      });
                      Navigator.pop(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff6673b4),
                          Color(0xff5867a2),
                          Color(0xff3f507f),
                          Color(0xff34456e)
                        ],
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(
                          maxWidth: double.infinity, minHeight: 50),
                      child: Text(
                        "SEND FEEDBACK",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
              Text('For Queries'),
              Icon(Icons.mail),
              Text('s160841@rguktsklm.ac.in'),
            ],
          ),
        ),
      ),
    );
  }
}
