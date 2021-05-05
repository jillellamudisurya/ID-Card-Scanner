import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idcardscanner/security_success.dart';

class Seclogin extends StatefulWidget {

  @override
  _SecloginState createState() => _SecloginState();
}

class _SecloginState extends State<Seclogin> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkey1 = GlobalKey<FormState>();


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
          SizedBox(height:30.0),
          Center(
              child: Text(
                'SECURITY LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              )
          ),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Form(

                key: formkey,
                child: TextFormField(

                  keyboardType: TextInputType.name,
                  obscureText: true,

                  validator: (String name){
                    if(name.isEmpty){
                      return "Required *";
                    }
                  },

                  decoration: InputDecoration(

                      labelText: 'Enter Name',
                      hintText: 'enter your name',
                      filled: true,
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formkey1,
              child: TextFormField(
                validator: (String password){
                  if(password.isEmpty){
                    return "Required *";
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
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius:BorderRadius.all(Radius.circular(20)),
                    )
                ),
              ),
            ),
          ),
          Center(
            child: RaisedButton.icon(onPressed: (){
              if(formkey.currentState.validate()&&formkey1.currentState.validate()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Secsuccess()));
              }
            },
              icon: Icon(
                Icons.login_sharp,
              ),
              label: Text('Login'),
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }
}