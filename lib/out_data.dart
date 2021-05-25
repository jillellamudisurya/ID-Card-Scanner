import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idcardscanner/database.dart';
import 'package:idcardscanner/stud_data.dart';

class OutData extends StatefulWidget {
  @override
  _OutDataState createState() => _OutDataState();
}

class _OutDataState extends State<OutData> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      initialData: null,
      value: DatabaseService().stud,
      child: Scaffold(
        body: StudData(),
      ),
    );
  }
}
