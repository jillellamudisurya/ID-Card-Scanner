import 'package:flutter/material.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import 'package:idcardscanner/user.dart';

class MyTable extends StatefulWidget {
  final List<StudentOut> studData;
  MyTable({this.studData});
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  int sortColumnIndex = 0;
  bool isAscending = false;
  List<StudentOut> studDatacopy;

  @override
  Widget build(BuildContext context) {
    var columns = [
      'id',
      'Name',
      'phone',
      'class',
      'room',
      'OutTime',
      'Scanned By'
    ];
    this.studDatacopy = widget.studData.toList();
    return BidirectionalScrollViewPlugin(
        child: DataTable(
            sortAscending: isAscending,
            sortColumnIndex: sortColumnIndex,
            columns: getColumns(columns),
            rows: getRows(studDatacopy)));
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
      studDatacopy.sort((s1, s2) => compareString(ascending, s1.id, s1.id));
    } else if (columnIndex == 1) {
      studDatacopy.sort((s1, s2) => compareString(ascending, s1.name, s2.name));
    } else if (columnIndex == 2) {
      studDatacopy
          .sort((s1, s2) => compareString(ascending, s1.phone, s1.phone));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
