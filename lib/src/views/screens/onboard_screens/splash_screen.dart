import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rentersparadise/src/views/screens/onboard_screens/intro_screen.dart';

class MySplashScreenPage extends StatefulWidget {
  MySplashScreenPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySplashScreenPageState createState() => _MySplashScreenPageState();
}

class _MySplashScreenPageState extends State<MySplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroScreens())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/alexandr-hovhannisyan-OIVvwDIvmsk-unsplash.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: Image(
                image: AssetImage("assets/RENDERS-PARADISE-LOGO-1.png"),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
