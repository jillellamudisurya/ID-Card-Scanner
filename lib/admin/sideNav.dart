import 'package:flutter/material.dart';
import 'package:idcardscanner/contactUs.dart';
import 'package:idcardscanner/feedback.dart';


// ignore: must_be_immutable
class SideNav extends StatefulWidget {
  String name, img;
  SideNav(this.name, this.img);
  @override
  _SideNavState createState() => _SideNavState(name, img);
}

class _SideNavState extends State<SideNav> {
  String name, img;
  _SideNavState(this.name, this.img);
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
            selectedTileColor: Colors.blueGrey,
            leading: Icon(
              Icons.person,
              color: Colors.deepOrange,
            ),
            title: Text('View Today'),
            onTap: () {},
          ),
                    Divider(),
                    ListTile(
            leading: Icon(
              Icons.contact_page_rounded,
              color: Color(0xff34456e),
            ),
            title: Text(
              'Conatact Us',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FeedBack()));
            },
          )

        ],
      ),
    );
  }
}
