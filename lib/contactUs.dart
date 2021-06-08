import 'package:flutter/material.dart';
//import 'package:flutter_beautiful_popup/main.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff34456e),
          title: Text('About Us'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/BG.png"), fit: BoxFit.cover),
          ),
          child: Column(children: [
            SizedBox(height: 180),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(),
                      child: TextButton(
                        onPressed: () {
                          
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/surya.jpg'),
                          radius: 80.0,
                        ),
                      ),
                    ),
                    Text(
                      'Surya',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Front-End Developer',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(),
                      child: TextButton(
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/yashwanth.jpg'),
                          radius: 80.0,
                        ),
                      ),
                    ),
                    Text(
                      'Yashwanth Sai',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Back-End Developer',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(),
                      child: TextButton(
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/aravindh.jpg'),
                          radius: 80.0,
                        ),
                      ),
                    ),
                    Text(
                      'Aravindh',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Front/Back-End Developer',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(),
                      child: TextButton(
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/saiganesh.jpg'),
                          radius: 80.0,
                        ),
                      ),
                    ),
                    Text(
                      'Sai Ganesh',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('Web Developer',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}
