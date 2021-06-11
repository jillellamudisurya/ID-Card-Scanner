import 'package:flutter/material.dart';
import 'package:idcardscanner/admin/admin_success.dart';
import 'package:idcardscanner/home.dart';
import 'package:idcardscanner/misc/loading.dart';
import 'package:idcardscanner/security/security_success.dart';
import 'package:idcardscanner/misc/user.dart';
import 'package:provider/provider.dart';
import 'package:idcardscanner/misc/checkAdmin.dart';

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
              return Adminsuccess(user.name, user.img);
            } else {
              return Secsuccess(user.name, user.img);
            }
          } else {
            return Loading();
          }
        });
  }
}
