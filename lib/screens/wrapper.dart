import 'package:flutter/material.dart';
import 'package:libero/models/global.dart';
import 'package:libero/models/user.dart';
import 'package:libero/screens/authenticate/register_success.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else if (isNewUser && user != null) {
      return RegisterSuccess();
    } else{
      return Home();
    }
  }
}
