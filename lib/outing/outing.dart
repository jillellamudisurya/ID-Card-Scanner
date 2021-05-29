import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:idcardscanner/services/allDb.dart';
import 'package:idcardscanner/misc/button_widget.dart';
import 'package:idcardscanner/errors/login_alert.dart';
import 'package:idcardscanner/security/secSideNav.dart';

String barcode = '-1';

// ignore: must_be_immutable
class Outing extends StatefulWidget {
  String name;
  Outing(this.name);
  @override
  _OutingState createState() => _OutingState(name);
}

class _OutingState extends State<Outing> {
  String name;
  _OutingState(this.name);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/adminsecurity.jpg'),
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
                    backgroundImage: AssetImage('assets/adminsecurity.jpg'),
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
        "#34456e",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() async {
        if (barcode != '-1') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CallDbOut(barcode, 'Out')));
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
        "#34456e",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
      if (!mounted) return;
      setState(() async {
        if (barcode != '-1') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CallDbOut(barcode, 'In')));
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
