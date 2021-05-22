import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:idcardscanner/button_widget.dart';
import 'package:idcardscanner/database.dart';
import 'package:idcardscanner/login_alert.dart';
import 'package:idcardscanner/barcode_result.dart';

String barcode = '-1';

class Outing extends StatefulWidget {
  @override
  _OutingState createState() => _OutingState();
}

class _OutingState extends State<Outing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[850],
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

                  // Text(
                  //   '$barcode',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  ButtonWidget(
                    onClicked: scanBarcodeOut,
                    text: 'OUT',
                  ),
                  SizedBox(height: 30),

                  CircleAvatar(
                    backgroundImage: AssetImage('assets/image.jpg'),
                    radius: 50.0,
                  ),

                  SizedBox(height: 30),

                  // Text(
                  //   '$barcode',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  ButtonWidget(
                    onClicked: scanBarcodeIn,
                    text: 'IN',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcodeOut() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() async {
        if (barcode != '-1') {
          bool res = await DatabaseService().outing(barcode, 'Out');
          if (res) {
            BarcodeResult a = BarcodeResult();
            a.result = barcode;
            Navigator.push(context, MaterialPageRoute(builder: (context) => a));
          } else {
            await AlertDialogs.okDialog(
                context, 'OUTSIDER', 'Please scan student ID card');
          }
        } else {
          await AlertDialogs.okDialog(
              context, 'Scan Error', 'Please Scan Barcode');
        }
      });
    } on PlatformException {
      barcode = ' Failed to get platform version';
    }
  }

  Future<void> scanBarcodeIn() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() async {
        if (barcode != '-1') {
          bool res = await DatabaseService().outing(barcode, 'In');
          if (res) {
            BarcodeResult a = BarcodeResult();
            a.result = barcode;
            Navigator.push(context, MaterialPageRoute(builder: (context) => a));
          } else {
            await AlertDialogs.okDialog(
                context, 'OUTSIDER', 'Please scan student ID card');
          }
        } else {
          await AlertDialogs.okDialog(
              context, 'Scan Error', 'Please Scan Barcode');
        }
      });
    } on PlatformException {
      barcode = ' Failed to get platform version';
    }
  }
}
