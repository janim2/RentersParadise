import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentersparadise/Screens/DashboardScreen.dart';

import 'app_state/WalkThroughState.dart';
void main() {
  runApp(

    MultiProvider(

        providers: [

          ChangeNotifierProvider<WalkThroughState>(create: (context) =>  WalkThroughState()),

          // Put The New State Class you create
          //  ChangeNotifierProvider<YourNewStateClass>(create: (context) =>  YourNewStateClass()),
        ],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {


  static Map<int, Color> color = {
    50: Color.fromRGBO(230, 120, 23, .1),
    100: Color.fromRGBO(230, 120, 23, .2),
    200: Color.fromRGBO(230, 120, 23, .3),
    300: Color.fromRGBO(230, 120, 23, .4),
    400: Color.fromRGBO(230, 120, 23, .5),
    500: Color.fromRGBO(230, 120, 23, .6),
    600: Color.fromRGBO(230, 120, 23, .7),
    700: Color.fromRGBO(230, 120, 23, .8),
    800: Color.fromRGBO(230, 120, 23, .9),
    900: Color.fromRGBO(230, 120, 23, 1),
  };

  final MaterialColor colorCustom = MaterialColor(0xffFCB30D, color);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      // Put Your Entry Widget here
      DashboardScreen(),
    );
  }
}
