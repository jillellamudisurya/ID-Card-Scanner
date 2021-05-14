import 'package:flutter/material.dart';

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
      body: Scrollbar(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.black, Colors.grey, Colors.black])),
          constraints: BoxConstraints.expand(),
          child: DataTable(
            showBottomBorder: true,
            columns: [
              DataColumn(
                  label: Text(
                'S.No',
                style: TextStyle(color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'ID',
                style: TextStyle(color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Name',
                style: TextStyle(color: Colors.white),
              )),
              DataColumn(
                  label: Text(
                'Phone',
                style: TextStyle(color: Colors.white),
              )),
              //DataColumn(label: Text('Parent Phone')),
              //DataColumn(label: Text('In Time')),
              //DataColumn(label: Text('Out Time')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('S160617',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('J. Surya',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('123456',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                DataCell(Text('2',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('S160841',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('M. Yashwanth',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('123456',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                DataCell(Text('3',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('S160755',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('I. Arvindh',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('123456',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: [
                DataCell(Text('4',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('S160105',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('K. Sai Ganesh',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
                DataCell(Text('123456',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
