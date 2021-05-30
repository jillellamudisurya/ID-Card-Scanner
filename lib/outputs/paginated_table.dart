import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/user.dart';

class MyTable extends StatefulWidget {
  MyTable({@required this.studData});
  final List<StudentOut> studData;
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
  int sortColumnIndex = 0;
  bool isAscending = false;
  @override
  Widget build(BuildContext context) {
    var dts = DTS(studData: widget.studData);
    var tableItemsCount = dts.rowCount;
    var defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    var isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
    _rowsPerPage =
        isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
    var columns = [
      'ID',
      'Name',
      'Phone',
      'Class',
      'Room',
      'OutTime',
      'Intime',
      'Scanned By'
    ];
    return PaginatedDataTable(
      onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage
          ? null
          : (rowCount) {
              setState(() {
                _rowsPerPage1 = rowCount;
              });
            },
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      source: dts,
      rowsPerPage:
          isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
            tooltip: column,
          ))
      .toList();
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

class DTS extends DataTableSource {
  List<StudentOut> studData;
  DTS({@required this.studData});
  @override
  DataRow getRow(int index) {
    final stud = studData[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(stud.id)),
      DataCell(Text(stud.name)),
      DataCell(Text(stud.phone)),
      DataCell(Text(stud.classR)),
      DataCell(Text(stud.room)),
      DataCell(Text(stud.outTime)),
      DataCell(Text(stud.inTime)),
      DataCell(Text(stud.scannedBy))
    ]);
  }

  @override
  int get rowCount => studData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
