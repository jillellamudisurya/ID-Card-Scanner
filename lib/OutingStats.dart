import 'package:flutter/material.dart';
import 'package:idcardscanner/out_data.dart';

class OutingStats extends StatefulWidget {
  @override
  _OutingStatsState createState() => _OutingStatsState();
}

class _OutingStatsState extends State<OutingStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: OutData(),
    );
  }
}
