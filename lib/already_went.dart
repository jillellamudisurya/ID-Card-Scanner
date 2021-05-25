import 'package:flutter/material.dart';
import 'package:idcardscanner/error.dart';
import 'package:idcardscanner/security_success.dart';

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
      body: Column(
        children: [
          Text(
            'Already went ' +
                state +
                '\nPlease scan ' +
                (state == 'Out' ? 'In' : 'Out'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Secsuccess()));
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
      body: Column(
        children: [
          Text('OUTSIDER!! please scan id card'),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Secsuccess()));
            },
            icon: Icon(Icons.home),
            label: Text('HOME'),
          ),
        ],
      ),
    );
  }
}
