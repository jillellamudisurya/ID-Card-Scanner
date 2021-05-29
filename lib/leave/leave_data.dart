import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idcardscanner/outputs/leave_stud.dart';
import 'package:idcardscanner/services/database.dart';
import 'package:provider/provider.dart';

class LeaveData extends StatefulWidget {
  @override
  _LeaveDataState createState() => _LeaveDataState();
}

class _LeaveDataState extends State<LeaveData> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().leaveDB,
      initialData: null,
      child: Scaffold(
        body: LeaveStud(),
      ),
    );
  }
}
