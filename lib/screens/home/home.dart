import 'package:flutter/material.dart';
import 'package:libero/models/user.dart';
import 'package:libero/screens/home/edit_profile.dart';
import 'package:libero/screens/home/profile_page.dart';
import 'package:libero/services/auth.dart';
import 'package:libero/services/database.dart';
import 'package:libero/shared/decorations.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditProfile(),
            );
          });
    }

    final user = Provider.of<User>(context);
    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user.uid).profiles,
      child: Scaffold(
        appBar: AppBar(
          title: Text('home page'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('edit profile'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: backgroundDec,
          child: ProfilePage(),
        ),
      ),
    );
  }
}
