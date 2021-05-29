import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/user.dart';

class MyTable extends StatefulWidget {
  MyTable({@required this.studData});
  final List<StudentOut> studData;
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  int sortColumnIndex = 0;
  bool isAscending = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var columns = [
      'ID',
      'Name',
      'Phone',
      'Class',
      'Room',
      'OutTime',
      'Scanned By'
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
              sortAscending: isAscending,
              sortColumnIndex: sortColumnIndex,
              columns: getColumns(columns),
              rows: getRows(widget.studData))),
    );
  }

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();
  List<DataRow> getRows(List<StudentOut> users) => users.map((StudentOut stud) {
        var cells = [
          stud.id,
          stud.name,
          stud.phone,
          stud.classR,
          stud.room,
          stud.outTime,
          stud.scannedBy
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      widget.studData.sort((s1, s2) => compareString(ascending, s1.id, s2.id));
    } else if (columnIndex == 1) {
      widget.studData
          .sort((s1, s2) => compareString(ascending, s1.name, s2.name));
    } else if (columnIndex == 2) {
      widget.studData
          .sort((s1, s2) => compareString(ascending, s1.phone, s2.phone));
    } else if (columnIndex == 3) {
      widget.studData
          .sort((s1, s2) => compareString(ascending, s1.classR, s2.classR));
    } else if (columnIndex == 4) {
      widget.studData
          .sort((s1, s2) => compareString(ascending, s1.room, s2.room));
    } else if (columnIndex == 5) {
      widget.studData
          .sort((s1, s2) => compareString(ascending, s1.outTime, s2.outTime));
    } else if (columnIndex == 6) {
      widget.studData.sort(
          (s1, s2) => compareString(ascending, s1.scannedBy, s2.scannedBy));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
