import 'package:flutter/material.dart';
import 'package:idcardscanner/security/todayOut.dart';
import 'package:idcardscanner/security/outingCount.dart';

// ignore: must_be_immutable
class SecSideNav extends StatefulWidget {
  String name, img;
  SecSideNav(this.name, this.img);
  @override
  _SecSideNavState createState() => _SecSideNavState(name, img);
}

class _SecSideNavState extends State<SecSideNav> {
  String name, img;
  _SecSideNavState(this.name, this.img);
  @override
  Widget build(BuildContext context) {
    return DisplayNav(name, img);
  }
}

// ignore: must_be_immutable
class DisplayNav extends StatefulWidget {
  String name, img;
  DisplayNav(this.name, this.img);
  @override
  _DisplayNavState createState() => _DisplayNavState(name, img);
}

class _DisplayNavState extends State<DisplayNav> {
  String name, img;
  _DisplayNavState(this.name, this.img);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: height * 0.2,
            color: Color(0xff34456e),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(img),
                  radius: 50.0,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black, height: 0),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.deepOrange,
            ),
            title: Text('Today Outing'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TodayOut()));
            },
          ),
          Divider(color: Colors.black, height: 0),
          ListTile(
            leading: Icon(
              Icons.format_list_numbered,
              color: Colors.deepOrange,
            ),
            title: Text('Outing Count'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CountToday()));
            },
          ),
        ],
      ),
    );
  }
}
