import 'package:flutter/material.dart';


Color buttonColor = Color(0xFFEE892F);


class BottomAppBarButton extends StatelessWidget {


  BottomAppBarButton({this.onPressed,@required this.buttonText});
  final Function onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onPressed,
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(4.0),
        elevation: 5.0,
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 27,
              fontWeight: FontWeight.bold,
              fontFamily: 'Futura'
            ),
          ),
        )
      ),
    );
  }
}
