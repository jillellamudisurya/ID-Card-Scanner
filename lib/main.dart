import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      //backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title:Text('ID Card Scanner') ,
        centerTitle: true,
        elevation: 0.0,
      ),


      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              Colors.black,
              Colors.grey,
              Colors.black
            ]
          )
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 50,),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/adminsecurity.jpg'),
                radius: 60.0,
              ),
              
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton.icon(
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
              ),
            ),
            SizedBox(height: 70,),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/adminsecurity.jpg'),
                radius: 60.0,
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton.icon(
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
            ),
            ),
          ],
        ),
      ),

    );
  }
}










