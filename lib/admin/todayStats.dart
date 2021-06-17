import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/loading.dart';
import 'package:idcardscanner/misc/user.dart';
import 'package:idcardscanner/services/database.dart';

class TodayStats extends StatefulWidget {
  @override
  _TodayStatsState createState() => _TodayStatsState();
}

class _TodayStatsState extends State<TodayStats> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Stats>(
      future: DatabaseService().todayCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Stats today = snapshot.data;
          int total = today.students,
              totalOut = today.totalOut,
              out = today.out,
              leave = today.leave;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff34456e),
                title: Text('Today Stats'),
                centerTitle: true,
                elevation: 0.0,
              ),
              body: Center(
                child: Container(
                  child: Text('Total Students->' +
                      total.toString() +
                      '\nToday total outing went->' +
                      totalOut.toString() +
                      "\nToday outing went and not returned->" +
                      out.toString() +
                      "\nTotal on leave->" +
                      leave.toString()),
                ),
              ));
        } else
          return Loading();
      },
    );
  }
}
