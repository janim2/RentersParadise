import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Check Screen"),
      ),
      body: Center(
        child:Text("Testing this screen"),
      ),
    );
  }
}