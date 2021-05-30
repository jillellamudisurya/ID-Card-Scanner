import 'package:flutter/material.dart';
import 'package:idcardscanner/wrapper.dart';

class StoredSuccess extends StatefulWidget {
  String fileName;
  StoredSuccess(this.fileName);
  @override
  _StoredSuccessState createState() => _StoredSuccessState(fileName);
}

class _StoredSuccessState extends State<StoredSuccess> {
  String fileName;
  _StoredSuccessState(this.fileName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Card Scanner'),
        backgroundColor: Color(0xff34456e),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Her file is stored ' + fileName,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Wrapper()));
            },
            icon: Icon(Icons.home),
            label: Text('HOME'),
          ),
        ],
      ),
    );
  }
}
