import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/loading.dart';
import 'package:idcardscanner/services/database.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart'; // import the package

class CountToday extends StatefulWidget {
  @override
  _CountTodayState createState() => _CountTodayState();
}

class _CountTodayState extends State<CountToday> {
  _getDateFromDate(DateTime dt) {
    var date = dt;
    return date.day.toString().padLeft(2, '0') +
        "-" +
        date.month.toString().padLeft(2, "0") +
        "-" +
        date.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      initialData: null,
      value: DatabaseService().stud(_getDateFromDate(DateTime.now())),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ID Card Scanner'),
          backgroundColor: Color(0xff34456e),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: GetCount(),
      ),
    );
  }
}

class GetCount extends StatefulWidget {
  @override
  _GetCountState createState() => _GetCountState();
}

class _GetCountState extends State<GetCount> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuerySnapshot>(context);

    Future<Map<String, double>> outingCount() async {
      double male = 0, female = 0;
      for (var i in data.documents) {
        DocumentSnapshot snap = await Firestore.instance
            .collection('Student_Ph')
            .document(i.documentID)
            .get();
        try {
          if (snap.data['gender'] == 'Male') {
            male++;
          } else {
            female++;
          }
        } catch (e) {
          print(e);
        }
      }
      Map<String, double> dataCount = {'Male': male, 'Female': female};
      return dataCount;
    }

    return FutureBuilder<Map<String, double>>(
        future: outingCount(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, double>> snapshot) {
          if (snapshot.hasData) {
            return MyHomePage(snapshot.data);
          } else {
            return Loading();
          }
        });
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  Map<String, double> data;
  MyHomePage(this.data);

  @override
  _MyHomePageState createState() => _MyHomePageState(data);
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> data;
  _MyHomePageState(this.data);
  double count = 0;
  @override
  Widget build(BuildContext context) {
    if (data.length == 0) {
      return Scaffold(
        body: Center(
          child: Text('NO DATA'),
        ),
      );
    }
    for (var a in data.entries) {
      count += a.value;
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Total Count of Outing went Students ' + count.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Male count is ' + data.values.first.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              'Female count is ' + data.values.last.toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            PieChart(
              dataMap: data,
              animationDuration: Duration(milliseconds: 1500),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width /
                  2.7, //determines the size of the chart
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              showLegends: true,
              legendPosition:
                  LegendPosition.right, //can be changed to top, left, bottom
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc, //can be changed to ChartType.ring
            ),
          ],
        ),
      ),
    );
  }
}
