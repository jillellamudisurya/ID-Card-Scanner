import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: TextButton(
          onPressed: onClicked,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff6673b4),
                  Color(0xff5867a2),
                  Color(0xff3f507f),
                  Color(0xff34456e)
                ],
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              constraints:
                  BoxConstraints(maxWidth: double.infinity, minHeight: 50),
              child: Text(
                text,
                style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
  // TextButton(
  //   child: Text(
  //     text,
  //     style: TextStyle(
  //       fontSize: 24
  //     ),
  //   ),
  //   style: ButtonStyle(

  //     backgroundColor: MaterialStateProperty.resolveWith<Color>(
  //     (Set<MaterialState> states) {
  //       if (states.contains(MaterialState.pressed))
  //         return Theme.of(context).colorScheme.primary.withBlue(10);
  //       return null; // Use the component's default.
  //     },
  //   ),
  //   ),

  //   onPressed: onClicked,
}
