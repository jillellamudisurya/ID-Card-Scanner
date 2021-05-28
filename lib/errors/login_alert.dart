import 'package:flutter/material.dart';

enum DialogsAction { ok }

class AlertDialogs {
  static Future<DialogsAction> okDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(DialogsAction.ok),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ))
            ],
          );
        });
  }
}
