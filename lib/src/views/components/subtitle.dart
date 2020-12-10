import 'package:flutter/material.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';


class SubTitle extends StatelessWidget {

  SubTitle({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20,top:30),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          color: TheColors.violet,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}