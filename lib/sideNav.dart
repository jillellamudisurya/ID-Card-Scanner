import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideNav extends StatefulWidget {
  String name;
  SideNav(this.name);
  @override
  _SideNavState createState() => _SideNavState(name);
}

class _SideNavState extends State<SideNav> {
  String name;
  _SideNavState(this.name);
  @override
  Widget build(BuildContext context) {
    return DisplayNav(name);
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
              color: Colors.amber,
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
