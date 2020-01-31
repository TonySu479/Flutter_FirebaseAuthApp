import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libero/models/decorations.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundDec,
        child: Center(
          child: SpinKitFadingCircle(color: Colors.white, size: 50.0),
        ));
  }
}
