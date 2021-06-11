import 'package:flutter/material.dart';
import 'package:idcardscanner/admin/admin_login.dart';
import 'package:idcardscanner/contactUs.dart';
import 'package:idcardscanner/feedback.dart';
import 'package:idcardscanner/security/security_login.dart';

class Homepage extends StatelessWidget {
  static final String title = 'Barcode Scanner';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      //backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Color(0xff34456e),
        title: Text('ID Card Scanner'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          Container(
            height: height * 0.2,
            color: Color(0xff34456e),
            child: Center(
              child: Center(
                child: Text(
                  'HOME',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.contact_page_rounded,
              color: Color(0xff34456e),
            ),
            title: Text(
              'Conatact Us',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FeedBack()));
            },
          )
        ],
      )),

      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/BG.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/adminsecurity.jpg'),
                radius: 60.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Seclogin()));
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
                      "SECURITY",
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/adminsecurity.jpg'),
                radius: 60.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Adminlogin()));
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
                      "ADMIN",
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}