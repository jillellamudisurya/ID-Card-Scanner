import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:idcardscanner/button_widget.dart';

class Outing extends StatefulWidget {
  @override
  _OutingState createState() => _OutingState();
}

class _OutingState extends State<Outing> {
  String barcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'OUTING',
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
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                Text(
                  '$barcode',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                ButtonWidget(
                  onClicked: scanBarcode,
                  text: 'OUT',
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                Text(
                  '$barcode',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                ButtonWidget(
                  onClicked: scanBarcode,
                  text: 'IN',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<void> scanBarcode() async {
    try{
      final barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException{
      barcode = ' Failed to get platform version';
    }
  }
}

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  String barcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'LEAVE',
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
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),

                Text(
                  '$barcode',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                ButtonWidget(
                  onClicked: scanBarcode,
                  text: 'OUT',
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50.0,
                ),

                SizedBox(height: 30),
                Text(
                  '$barcode',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                  ),
                ),
                ButtonWidget(
                  onClicked: scanBarcode,
                  text: 'IN',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<void> scanBarcode() async {
    try{
      final barcode = await FlutterBarcodeScanner.scanBarcode("#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException{
      barcode = ' Failed to get platform version';
    }
  }
}