import 'package:flutter/material.dart';
import 'package:idcardscanner/outing/out_data.dart';

class OutingStats extends StatefulWidget {
  final String date;
  OutingStats({this.date});
  @override
  _OutingStatsState createState() => _OutingStatsState();
}

class _OutingStatsState extends State<OutingStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Color(0xff34456e),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: OutData(
        date: widget.date,
      ),
    );
  }
}
