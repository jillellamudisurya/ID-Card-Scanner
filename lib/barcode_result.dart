import 'package:flutter/material.dart';
import 'package:idcardscanner/wrapper.dart';

// ignore: must_be_immutable
class BarcodeResult extends StatefulWidget {
  String result = '';
  @override
  _BarcodeResultState createState() => _BarcodeResultState(result);
}

class _BarcodeResultState extends State<BarcodeResult> {
  String result;
  _BarcodeResultState(this.result);
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
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/BG.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: 170),
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
            SizedBox(height: 30.0),
            Center(
                child: Text(
              'The Result of SCAN DATA is:: ',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.red,
              ),
            )),
            SizedBox(height: 30.0),
            Center(
                child: Text(result,
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 30.0,
                    ))),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Wrapper()));
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
