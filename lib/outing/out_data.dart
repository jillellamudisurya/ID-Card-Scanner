import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idcardscanner/services/database.dart';
import 'package:idcardscanner/outputs/stud_data.dart';

class OutData extends StatefulWidget {
  final String date;
  OutData({this.date});
  @override
  _OutDataState createState() => _OutDataState();
}

class _OutDataState extends State<OutData> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      initialData: null,
      value: DatabaseService().stud(widget.date),
      child: Scaffold(
        body: StudData(),
      ),
    );
  }
}
