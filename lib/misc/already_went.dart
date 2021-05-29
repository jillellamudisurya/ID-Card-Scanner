import 'package:flutter/material.dart';
import 'package:idcardscanner/wrapper.dart';

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

class Outsider extends StatefulWidget {
  @override
  _OutsiderState createState() => _OutsiderState();
}

class _OutsiderState extends State<Outsider> {
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
          Text('OUTSIDER!! please scan id card'),
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
