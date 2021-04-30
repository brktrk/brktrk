import 'package:brktrk/constants.dart';
import 'package:brktrk/features/home/view/home.dart';
import 'package:brktrk/features/home/view/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: backgroundColor,
    statusBarColor: backgroundColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }

  // ignore: non_constant_identifier_names
  Main() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Config>(create: (context) => Config()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'brktrk',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0, // This removes the shadow from all App Bars.
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fontFamily: 'Poppins-Regular',
          primaryColor: backgroundColor,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => Home(),
          "/portfolio": (context) => Portfolio(),
        },
      ),
    );
  }
}
