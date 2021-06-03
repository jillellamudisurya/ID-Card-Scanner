import 'package:flutter/material.dart';

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
        title: Text('ID Card Scanner'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('Surya \n\nAravindh \n\nSai Ganesh  \n\nYashwanth'),
      ),
    );
  }
}
