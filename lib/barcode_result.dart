import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarcodeResult extends StatelessWidget {

  String result='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: Text('ID Card Scanner'),
              backgroundColor: Colors.grey[900],
              centerTitle: true,
              elevation: 0.0,
            ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black, Colors.grey, Colors.black])),
        child: Column(
          children: [
            SizedBox(height:70),
          Center(
            child: Text(
              'SUCCESSFUL',
              style: TextStyle(
                color: Colors.green,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
              ),

          ),
          SizedBox(height:30.0),

          Center(
            child: Text(
              'The Result of SCAN DATA is:: ',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
              )
            ),
          SizedBox(height:30.0),
          Center(
            child: Text(result,
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 30.0,
              )
            )
            ),
            SizedBox(height:30.0),
            Center(
              child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      
                    },
                    icon: Icon(Icons.home),
                    label: Text('HOME'),
                  ),
                )
        ],
        ),
      ),
    );
  }
}