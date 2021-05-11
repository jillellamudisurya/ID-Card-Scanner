import 'package:flutter/material.dart';

class ScanError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Scan Error',
        style: TextStyle(
          color: Colors.red,
          fontSize: 50.0,
        ),
      ),
    );
  }
}
