import 'dart:io';
import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/user.dart';
import 'package:idcardscanner/outputs/storedSuccess.dart';
import 'package:path_provider/path_provider.dart';

class MyTable extends StatefulWidget {
  MyTable({@required this.studData, @required this.columns});
  final List<StudentOut> studData;
  final List<String> columns;
  @override
  _MyTableState createState() => _MyTableState(studData);
}

class _MyTableState extends State<MyTable> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
  int sortColumnIndex = 0;
  bool isAscending = false;
  List<StudentOut> temp;
  _MyTableState(this.temp);
  var dts;
  var tableItemsCount;
  var defaultRowsPerPage;
  var isRowCountLessDefaultRowsPerPage;
  var columns;
  TextEditingController controller;
  String _searchResult;
  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.csv');
  }

  @override
  Widget build(BuildContext context) {
    dts = DTS(studData: temp);
    tableItemsCount = dts.rowCount;
    defaultRowsPerPage = 1;
    isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
    _rowsPerPage =
        isRowCountLessDefaultRowsPerPage ? defaultRowsPerPage : tableItemsCount;
    columns = widget.columns;
    controller = TextEditingController();
    _searchResult = '';

    callDTS() {
      dts = DTS(studData: temp);
      tableItemsCount = dts.rowCount;
      defaultRowsPerPage = 1;
      isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
      _rowsPerPage = isRowCountLessDefaultRowsPerPage
          ? defaultRowsPerPage
          : tableItemsCount;
      columns = widget.columns;
      return dts;
    }

    return ListView(
      children: [
        Container(
            child: ElevatedButton(
          child: Text('Click to download'),
          onPressed: () async {
            final file = await _localFile;

            String data = '';
            for (var b in columns) {
              data += b + ",";
            }
            data += "\n";
            for (var stud in temp) {
              if (stud.id != null) data += stud.id + ",";
              if (stud.name != null) data += stud.name + ",";
              if (stud.gender != null) data += stud.gender + ",";
              if (stud.phone != null) data += stud.phone + ",";
              if (stud.classR != null) data += stud.classR + ",";
              if (stud.room != null) data += stud.room + ",";
              if (stud.outTime != null) data += stud.outTime + ",";
              if (stud.inTime != null) data += stud.inTime + ",";
              if (stud.scannedBy != null) data += stud.scannedBy + ",";
              data += '\n';
            }
            file.writeAsString(data);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => StoredSuccess(
                        'Android/data/com.example.idcardscanner/files/data.csv')));
          },
        )),
        Card(
          child: new ListTile(
            leading: new Icon(Icons.search),
            title: new TextField(
//                controller: controller,
                decoration: new InputDecoration(
                    hintText: 'Search', border: InputBorder.none),
                onChanged: (value) {
                  setState(() {
                    _searchResult = value;
                    temp = widget.studData
                        .where((user) =>
                            user.id
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.name
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.classR
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.inTime
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.outTime
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.phone
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.room
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()) ||
                            user.scannedBy
                                .toLowerCase()
                                .contains(_searchResult.toLowerCase()))
                        .toList();
                  });
                }),
            // trailing: new IconButton(
            //   icon: new Icon(Icons.cancel),
            //   onPressed: () {
            //     setState(() {
            //       controller.clear();
            //       _searchResult = '';
            //       temp = widget.studData;
            //     });
            //   },
            // ),
          ),
        ),
        PaginatedDataTable(
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
          source: callDTS(),
          rowsPerPage:
              isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
        ),
      ],
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
    List<DataCell> cells = [];
    Color r = Colors.white;
    if (stud.inTime == 'NOT RETURNED') r = Colors.red[300];
    if (stud.id != null) cells.add(DataCell(Text(stud.id)));
    if (stud.name != null) cells.add(DataCell(Text(stud.name)));
    if (stud.gender != null) cells.add(DataCell(Text(stud.gender)));
    if (stud.phone != null) cells.add(DataCell(Text(stud.phone)));
    if (stud.classR != null) cells.add(DataCell(Text(stud.classR)));
    if (stud.room != null) cells.add(DataCell(Text(stud.room)));
    if (stud.outTime != null) cells.add(DataCell(Text(stud.outTime)));
    if (stud.inTime != null) cells.add(DataCell(Text(stud.inTime)));
    if (stud.scannedBy != null) cells.add(DataCell(Text(stud.scannedBy)));
    MaterialStateProperty<Color> s =
        MaterialStateColor.resolveWith((states) => r);
    return DataRow.byIndex(index: index, cells: cells, color: s);
  }

  @override
  int get rowCount => studData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
