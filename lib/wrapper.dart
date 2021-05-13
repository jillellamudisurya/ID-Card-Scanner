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
    if (user != null) {
      if (CheckAdmin().isAdmin(user.uid))
        return Adminsuccess();
      else
        return Secsuccess();
    }
    return Homepage();
  }
}
