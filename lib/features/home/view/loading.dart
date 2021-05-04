import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:brktrk/menu/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.getHttp();
    if (config.itemCount == true) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/');
      });
    }
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
