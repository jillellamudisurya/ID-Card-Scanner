import 'package:flutter/material.dart';

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
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black, Colors.grey, Colors.black])),
       constraints: BoxConstraints.expand(),
      
          child: DataTable(
            columns: [
              DataColumn(label: Text('S.No',
                style: TextStyle(color: Colors.white ),)),
              DataColumn(label: Text('ID',
              style: TextStyle(color: Colors.white ),)),
              DataColumn(label: Text('Name',
              style: TextStyle(color: Colors.white ),)),
              DataColumn(label: Text('Phone',
              style: TextStyle(color: Colors.white ),)),
              //DataColumn(label: Text('Parent Phone')),
              //DataColumn(label: Text('In Time')),
              //DataColumn(label: Text('Out Time')),
            ],
            rows: [],
          ),
        
        ),
    );
  }
}