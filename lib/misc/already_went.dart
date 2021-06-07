import 'package:flutter/material.dart';
//import 'package:idcardscanner/errors/error.dart';
import 'package:idcardscanner/wrapper.dart';
import 'package:idcardscanner/misc/add_data.dart';

// ignore: must_be_immutable
class Wentout extends StatefulWidget {
  String state;
  Wentout(this.state);
  @override
  _WentoutState createState() => _WentoutState(state);
}

class _WentoutState extends State<Wentout> {
  String state;
  _WentoutState(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Color(0xff34456e),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Already went ' +
                  state +
                  '\nPlease scan ' +
                  (state == 'Out' ? 'In' : 'Out'),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Wrapper()));
            },
            icon: Icon(Icons.home),
            label: Text('HOME'),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Outsider extends StatefulWidget {
  String scandata;
  Outsider(this.scandata);
  @override
  _OutsiderState createState() => _OutsiderState(scandata);
}

class _OutsiderState extends State<Outsider> {
  String scandata;

  _OutsiderState(this.scandata);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Color(0xff34456e),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'The Result Data is:: ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(scandata,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            Text(
              'You are an OUTSIDER!!\nPlease Scan college ID card',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Wrapper()));
              },
              icon: Icon(Icons.home),
              label: Text('HOME'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "If you want to add your data to our database click below.\nYour data will be verified by Database Team and then added shortly.",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              "Note:Don't worry!!                              \nYour data is totally safe with us!",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddToDB()));
              },
              icon: Icon(Icons.navigate_next),
              label: Text("ADD DATA"),
            )
          ],
        ),
      ),
    );
  }
}
