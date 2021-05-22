import 'package:flutter/material.dart';
import 'package:idcardscanner/database.dart';
import 'package:idcardscanner/loading.dart';

class SecSideNav extends StatefulWidget {
  @override
  _SecSideNavState createState() => _SecSideNavState();
}

class _SecSideNavState extends State<SecSideNav> {
  static int c = 0;
  static String name;
  @override
  Widget build(BuildContext context) {
    if (c == 0) {
      c = 1;
      return FutureBuilder<String>(
          future: DatabaseService().getName(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              name = snapshot.data;
              return DisplayNav(name);
            } else {
              return Loading();
            }
          });
    } else {
      return DisplayNav(name);
    }
  }
}

// ignore: must_be_immutable
class DisplayNav extends StatefulWidget {
  String name;
  DisplayNav(this.name);
  @override
  _DisplayNavState createState() => _DisplayNavState(name);
}

class _DisplayNavState extends State<DisplayNav> {
  String name;
  _DisplayNavState(this.name);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.2,
            child: Container(
              child: Text(
                name,
                textAlign: TextAlign.center,
              ),
              color: Colors.blueGrey,
            ),
          ),
          Divider(color: Colors.black, height: 0),
          ListTile(
            selectedTileColor: Colors.blueGrey,
            leading: Icon(
              Icons.person,
              color: Colors.deepOrange,
            ),
            title: Text('View Today'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
