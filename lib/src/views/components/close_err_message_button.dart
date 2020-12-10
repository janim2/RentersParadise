import 'package:flutter/material.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';

class CloseErrorMessageButton extends StatelessWidget {
  CloseErrorMessageButton();
  // final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 10),
        child: Material(
          color: TheColors.orange,
          borderRadius: BorderRadius.circular(10.0),
          elevation: 5.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Close',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
