import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/CloseErrorMessageButton.dart';
import 'package:rentersparadise/Components/TheColors.dart';

class ErrorMessage extends StatelessWidget {
  ErrorMessage({@required this.contentText});
  // final String title;
  final String contentText;
  // final bool startSpinner;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      title: Center(
        child: Text(
          'An Error Occurred !!!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: TheColors.orange,
            fontSize: 20.0,
            letterSpacing: 1.0,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      content: Text(
        contentText,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: TheColors.violet,
          fontSize: 18.0,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: CloseErrorMessageButton(),
        ),
      ],
    );
  }
}
