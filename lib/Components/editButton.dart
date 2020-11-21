import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';

/*
* This button is used on the custom card
* when clicked, the user navigates to the contact page
*/
class EditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide.none
      ),
      buttonColor: TheColors.orange,
      child: RaisedButton(
        child: Text(
            "EDIT",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Futura"
        ),),
        onPressed: (){},
      ),
    );
  }
}
