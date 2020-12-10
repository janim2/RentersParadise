import 'package:flutter/material.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';

/*
* This button is used on the custom card
* when clicked, the user navigates to the contact page
*/
class ContactButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none),
      buttonColor: TheColors.orange,
      child: RaisedButton(
        child: Text(
          "CONTACT",
          style: TextStyle(color: Colors.white, fontFamily: "Futura"),
        ),
        onPressed: () {},
      ),
    );
  }
}
