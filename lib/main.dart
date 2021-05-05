import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:idcardscanner/button_widget.dart';
import 'package:idcardscanner/admin_login.dart';
import 'package:idcardscanner/security_login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}
class Homepage extends StatelessWidget {
  static final String title = 'Barcode Scanner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title:Text('ID Card Scanner') ,
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
                'WELCOME',

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image.jpg'),
              radius: 60.0,
            ),
          ),
          Center(
            child: RaisedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Seclogin()));
                },
                icon: Icon(
                  Icons.login,
                ),
                label: Text(
                    'SECURITY',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              color: Colors.blue,
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image.jpg'),
              radius: 60.0,
            ),
          ),
          Center(
            child: RaisedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminlogin()));
                },
                icon: Icon(
                  Icons.login,
                ),
                label: Text(
                      'ADMIN',
                      style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                )
            ),
              color: Colors.blue,
          ),
          ),
        ],
      ),

    );
  }
}










