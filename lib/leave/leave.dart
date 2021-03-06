import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:idcardscanner/services/allDb.dart';
import 'package:idcardscanner/misc/button_widget.dart';
import 'package:idcardscanner/errors/login_alert.dart';

String barcode = '-1';

// ignore: must_be_immutable
class Leave extends StatefulWidget {
  String name;
  Leave(this.name);
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  String name;
  //String barcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEAVE'),
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
                  builder: (context) => CallDbLeave(barcode, 'Out')));
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
                  builder: (context) => CallDbLeave(barcode, 'In')));
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
