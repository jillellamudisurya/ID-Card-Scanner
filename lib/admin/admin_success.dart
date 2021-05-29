import 'package:flutter/material.dart';
import 'package:idcardscanner/errors/error.dart';
import 'package:idcardscanner/leave/LeaveStats.dart';
import 'package:idcardscanner/outing/OutingStats.dart';
import 'package:idcardscanner/admin/sideNav.dart';

// ignore: must_be_immutable
class Adminsuccess extends StatefulWidget {
  String name;
  // this is constructor
  Adminsuccess(this.name);
  @override
  _AdminsuccessState createState() => _AdminsuccessState(name);
}

class _AdminsuccessState extends State<Adminsuccess> {
  String title = 'AlertDialog2', name;
  _AdminsuccessState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Color(0xff34456e),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await AlertDialogs2.yesCancelDialog(
                    context, 'Sign Out', 'Are You Sure ?');
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Signout',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    backgroundColor: Color(0xff34456e)),
              ))
        ],
      ),
      drawer: SideNav(name),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/BG.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/stats.png'),
                    radius: 50.0,
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OutingStats()));
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
                          "OUTING STATISTICS",
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/stats.png'),
                    radius: 50.0,
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaveStats()));
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
                          "LEAVE STATISTICS",
                          style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
