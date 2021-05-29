import 'package:flutter/material.dart';
import 'leave_data.dart';

class LeaveStats extends StatefulWidget {
  @override
  _LeaveStatsState createState() => _LeaveStatsState();
}

class _LeaveStatsState extends State<LeaveStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Color(0xff34456e),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: LeaveData(),
    );
  }
}
