import 'package:flutter/material.dart';
import 'package:idcardscanner/error.dart';
import 'package:idcardscanner/LeaveStats.dart';
import 'package:idcardscanner/OutingStats.dart';
import 'package:idcardscanner/sideNav.dart';

class Adminsuccess extends StatefulWidget {
  @override
  _AdminsuccessState createState() => _AdminsuccessState();
}

class _AdminsuccessState extends State<Adminsuccess> {
  String title = 'AlertDialog2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
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
                    backgroundColor: Colors.black),
              ))
        ],
      ),
      drawer: SideNav(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black, Colors.grey, Colors.black])),
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                'ADMIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/stats.png'),
                    radius: 50.0,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OutingStats()));
                    },
                    icon: Icon(Icons.stacked_bar_chart),
                    label: Text('Outing Statistics'),
                  ),
                  SizedBox(height: 30),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/stats.png'),
                    radius: 50.0,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaveStats()));
                    },
                    icon: Icon(Icons.stacked_bar_chart),
                    label: Text('Leave Statistics'),
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
