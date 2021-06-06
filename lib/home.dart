import 'package:flutter/material.dart';
import 'package:idcardscanner/admin/admin_login.dart';
import 'package:idcardscanner/contactUs.dart';
import 'package:idcardscanner/feedback.dart';
import 'package:idcardscanner/security/security_login.dart';
import 'package:page_transition/page_transition.dart';

class Homepage extends StatelessWidget {
  static final String title = 'Barcode Scanner';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        int sensitivity = 8;
        if (details.delta.dx < -sensitivity) {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeftJoined,
                  childCurrent: Homepage(),
                  duration: Duration(milliseconds: 700),
                  reverseDuration: Duration(milliseconds: 700),
                  child: Adminlogin()));
        }
      },
      child: Scaffold(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedBack()));
              },
            )
          ],
        )),
        body: Seclogin(),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.arrow_right_outlined),
          label: Text("Admin"),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftJoined,
                    childCurrent: Homepage(),
                    duration: Duration(milliseconds: 700),
                    reverseDuration: Duration(milliseconds: 700),
                    child: Adminlogin()));
          },
        ),
      ),
    );
  }
}
