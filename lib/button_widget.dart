import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget(
  {
    @required this.text,
    @required this.onClicked,

    Key key,
  }
      ):super(key: key);

  @override
  Widget build(BuildContext context) =>TextButton(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 24
      ),
    ),
    style: ButtonStyle(
     
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return Theme.of(context).colorScheme.primary.withBlue(10);
        return null; // Use the component's default.
      },
    ), 
    ),
    
    onPressed: onClicked,
  );
}
