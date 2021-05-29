import 'package:flutter/material.dart';
import 'package:idcardscanner/outing/outing.dart';
import 'package:idcardscanner/leave/leave.dart';
import 'package:idcardscanner/errors/error.dart';
import 'package:idcardscanner/security/secSideNav.dart';

// ignore: must_be_immutable
class Secsuccess extends StatefulWidget {
  String name, img;
  Secsuccess(this.name, this.img);
  @override
  _SecsuccessState createState() => _SecsuccessState(name, img);
}

class _SecsuccessState extends State<Secsuccess> {
  String name, img;
  _SecsuccessState(this.name, this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: SecSideNav(name, img),
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
                    backgroundImage: AssetImage('assets/adminsecurity.jpg'),
                    radius: 50.0,
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Outing(name)));
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
                          "OUTING",
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
                    backgroundImage: AssetImage('assets/adminsecurity.jpg'),
                    radius: 50.0,
                  ),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Leave(name)));
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
                          "LEAVE",
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
