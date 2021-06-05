import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final labelText;
  final IconData icon;
  final Function validator;
  Input({this.labelText, this.icon, this.validator});
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: Form(
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xff34456e),
                )),
          ),
        ),
      ),
      data: Theme.of(context).copyWith(primaryColor: Color(0xff34456e)),
    );
  }
}
