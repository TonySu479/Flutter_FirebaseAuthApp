import 'package:flutter/material.dart';

import 'package:libero/models/decorations.dart';
import 'package:libero/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundDec,
      ),
    );
  }
}
