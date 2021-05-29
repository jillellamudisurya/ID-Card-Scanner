import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/loading.dart';
import 'package:idcardscanner/misc/user.dart';
import 'package:idcardscanner/outputs/table.dart';
import 'package:idcardscanner/services/database.dart';
import 'package:provider/provider.dart';

class TodayOut extends StatefulWidget {
  @override
  _TodayOutState createState() => _TodayOutState();
}

class _TodayOutState extends State<TodayOut> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      initialData: null,
      value: DatabaseService().stud,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ID Card Scanner'),
          backgroundColor: Color(0xff34456e),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: TodayData(),
      ),
    );
  }
}

class TodayData extends StatefulWidget {
  @override
  _TodayDataState createState() => _TodayDataState();
}

class _TodayDataState extends State<TodayData> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuerySnapshot>(context);

    Future<List<StudentOut>> outing() async {
      List<StudentOut> studData = [];
      for (var i in data.documents) {
        DocumentSnapshot snap = await Firestore.instance
            .collection('Student_Ph')
            .document(i.documentID)
            .get();
        try {
          studData.add(StudentOut(
              id: snap.data['id'],
              name: snap.data['name'],
              outTime: i.data['OutTime'],
              inTime: i.data['InTime'],
              scannedBy: i.data['ScannedBy']));
        } catch (e) {
          print(e);
        }
      }
      return studData;
    }

    return FutureBuilder<List<StudentOut>>(
      future: outing(),
      builder:
          (BuildContext context, AsyncSnapshot<List<StudentOut>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return MyTable(
              studData: snapshot.data,
              columns: ['ID', 'Name', 'OutTime', 'Intime', 'Scanned By'],
            );
        }
      },
    );
  }
}