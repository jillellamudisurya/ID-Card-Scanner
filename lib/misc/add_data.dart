import 'package:flutter/material.dart';
import 'package:idcardscanner/misc/input_widget.dart';
import 'package:idcardscanner/misc/button_widget.dart';

class AddToDB extends StatelessWidget {
  final String name = "";
  final String id = "";
  final String dob = "";
  final String emergencyNumber = "";
  final String blood = "";
  final String address = "";
  final String adhaar = "";
  final String classR = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff34456e),
        elevation: 0,
        centerTitle: true,
        title: Text("Add To DB"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Input(
                validator: (String name) {
                  if (name.isEmpty) {
                    return "Required *";
                  } else if (name.length < 7) {
                    return "Length should be more than 7";
                  } else {
                    return null;
                  }
                },
                labelText: "Full Name",
                icon: Icons.account_circle_rounded,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {
                  if (name.isEmpty) {
                    return "Required *";
                  } else if (name.length != 7) {
                    return "Not valid ID";
                  } else {
                    return null;
                  }
                },
                labelText: "ID Number",
                icon: Icons.account_circle_outlined,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {},
                labelText: "Class",
                icon: Icons.location_on_outlined,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {},
                labelText: "Date Of Birth",
                icon: Icons.date_range,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {},
                labelText: "Emergency Number",
                icon: Icons.phone,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {},
                labelText: "Blood Group",
                icon: Icons.local_hospital_outlined,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {},
                labelText: "Address",
                icon: Icons.location_city_outlined,
              ),
              SizedBox(height: 10),
              Input(
                validator: (String name) {},
                labelText: "Aadhaar Number",
                icon: Icons.lock_outlined,
              ),
              SizedBox(height: 10),
              Text(
                "Enter Aadhaar only if your ID card's bar code has aadhaar number in it.We don't need your aadhaar in any other case.",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  width: double.infinity,
                  child: ButtonWidget(text: "SUBMIT", onClicked: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
