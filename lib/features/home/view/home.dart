import 'package:brktrk/config.dart';
import 'package:brktrk/constants.dart';
import 'package:brktrk/menu/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
// ignore: must_be_immutable
class Home extends StatelessWidget {
  var _context;

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<Config>(context, listen: true);
    config.getHttp();
    _context = context;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          brightness: Brightness.dark,
          titleSpacing: 40,
          title: Image.asset(
            'assets/brktrk.png',
            fit: BoxFit.cover,
            height: 24,
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
                padding: EdgeInsets.only(right: 30),
                //icon: SvgPicture.asset('assets/menu.svg'),
                color: backgroundColor,
                iconSize: 30,
                icon: Icon(Ionicons.md_menu),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return MainMenu.menu.map((choice) {
                    return PopupMenuItem<String>(
                      textStyle: TextStyle(color: Color(0xb3ffffff)),
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                })
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Burak Türk",
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  color: Colors.white,
                  fontSize: 36),
            ),
            SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  animatedTexts: config.headlineKeysArray,
                  onTap: () {},
                ),
              ),
            )
          ],
        )));
  }

  void choiceAction(String choice) {
    switch (choice) {
      case "Portfolio":
        Navigator.pushNamed(_context, '/portfolio');
        break;
      case "About":
        Navigator.pushNamed(_context, '/about');
        break;
      case "Resume":
        Navigator.pushNamed(_context, '/resume');
        break;
    }
  }
}
