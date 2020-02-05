import 'package:flutter/cupertino.dart';
import 'package:libero/models/user.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<UserData>(context);

    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'name: ${profiles.name} ',
            ),
            Text(
              'birthdate: ${profiles.birthdate} ',
            ),
            Text(
              'gender: ${profiles.gender} ',
            )
          ],
        )
      ],
    ));
  }
}
