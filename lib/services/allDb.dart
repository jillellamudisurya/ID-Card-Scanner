import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/already_went.dart';
import 'package:idcardscanner/outputs/barcode_result.dart';
import 'package:idcardscanner/services/database.dart';
import 'package:idcardscanner/misc/loading.dart';

// ignore: must_be_immutable
class CallDbOut extends StatefulWidget {
  String scan, state;
  CallDbOut(this.scan, this.state);
  @override
  _CallDbOutState createState() => _CallDbOutState(scan, state);
}

class _CallDbOutState extends State<CallDbOut> {
  String scan, state;
  _CallDbOutState(this.scan, this.state);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: DatabaseService().outing(scan, state),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 1) {
              BarcodeResult a = BarcodeResult();
              a.result = scan;
              return a;
            } else if (snapshot.data == 0) {
              // Future.delayed(
              //     Duration.zero,
              //     () => AlertDialogs.okDialog(context, 'Already went ' + state,
              //         'Please scan' + state == 'Out' ? 'In' : 'Out'));
              return Wentout(state);
            } else {
              // AlertDialogs.okDialog(
              //     context, 'OUTSIDER', 'Please scan student ID card');
              return Outsider(scan);
            }
          } else {
            return Loading();
          }
        });
  }
}

// ignore: must_be_immutable
class CallDbLeave extends StatefulWidget {
  String scan, state;
  CallDbLeave(this.scan, this.state);
  @override
  _CallDbLeaveState createState() => _CallDbLeaveState(scan, state);
}

class _CallDbLeaveState extends State<CallDbLeave> {
  String scan, state;
  _CallDbLeaveState(this.scan, this.state);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: DatabaseService().leave(scan, state),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 1) {
              BarcodeResult a = BarcodeResult();
              a.result = scan;
              return a;
            } else if (snapshot.data == 0) {
              // Future.delayed(
              //     Duration.zero,
              //     () => AlertDialogs.okDialog(context, 'Already went ' + state,
              //         'Please scan' + state == 'Out' ?
              //'In' : 'Out'));
              return Wentout(state);
            } else {
              // AlertDialogs.okDialog(
              //     context, 'OUTSIDER', 'Please scan student ID card');
              return Outsider(scan);
            }
          } else {
            return Loading();
          }
        });
  }
}
