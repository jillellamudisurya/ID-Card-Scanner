import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/loading.dart';
import 'package:idcardscanner/misc/user.dart';
import 'package:provider/provider.dart';
import 'package:idcardscanner/outputs/paginated_table.dart';

class LeaveStud extends StatefulWidget {
  @override
  _LeaveStudState createState() => _LeaveStudState();
}

class _LeaveStudState extends State<LeaveStud> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuerySnapshot>(context);
    Future<List<StudentOut>> leave() async {
      List<StudentOut> studData = [];
      for (var i in data.documents) {
        DocumentSnapshot snap = await Firestore.instance
            .collection('Students')
            .document(i.documentID)
            .get();
        try {
          studData.add(StudentOut(
            classR: snap.data['class'],
            id: snap.data['id'],
            name: snap.data['name'],
//            gender: snap.data['gender'],
            phone: snap.data['emergenceyNumber'],
            //          room: snap.data['room'],
            outTime: i.data['OutTime'],
            outScannedBy: i.data['OutScannedBy'],
            inTime: i.data['InTime'],
            inScannedBy: i.data['InScannedBy'],
          ));
        } catch (e) {
          print(e);
        }
      }
      return studData;
    }

    return FutureBuilder<List<StudentOut>>(
      future: leave(),
      builder:
          (BuildContext context, AsyncSnapshot<List<StudentOut>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
          if (snapshot.hasData)
            return MyTable(
              studData: snapshot.data,
              columns: [
                'ID',
                'Name',
//                'Gender',
                'Emergency Number',
                'Class',
                //               'Room',
                'Out Time',
                'Out Scanned By',
                'In Time',
                'In Scanned By'
              ],
            );
          return Loading();
        }
      },
    );
  }
}
