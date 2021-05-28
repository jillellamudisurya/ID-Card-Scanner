import 'package:flutter/material.dart';
import 'package:idcardscanner/admin_success.dart';
import 'package:idcardscanner/home.dart';
import 'package:idcardscanner/security_success.dart';
import 'package:idcardscanner/user.dart';
import 'package:provider/provider.dart';
import 'package:idcardscanner/checkAdmin.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) return Homepage();

    return FutureBuilder<bool>(
        future: CheckAdmin().isAdmin(user.uid),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return Adminsuccess(user.name);
            } else {
              return Secsuccess(user.name);
            }
          } else {
            return Container();
          }
        });
  }
}
