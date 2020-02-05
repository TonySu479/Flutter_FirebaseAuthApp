import 'package:flutter/material.dart';
import 'package:libero/services/auth.dart';
import 'package:libero/shared/decorations.dart';

class RegisterSuccess extends StatefulWidget {
  @override
  _RegisterSuccessState createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDec,
      child: Column(
        children: <Widget>[
          Text('registration success!'),
          FlatButton(
            child: Text('continue'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
