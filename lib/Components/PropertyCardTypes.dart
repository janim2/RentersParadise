import 'package:flutter/material.dart';

const cardTypeColor = Color(0xFFEDEDED);
const cardTextColor = Color(0xFFC1C1C1);

class PropertyCardType extends StatelessWidget {
  PropertyCardType(
      {@required this.cardText,
      @required this.onPress,
      this.cardTextColor,
      this.cardTypeColor});

  final Color cardTypeColor;
  final Color cardTextColor;
  final String cardText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 18, bottom: 15),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(25),
          color: cardTypeColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              cardText,
              style: TextStyle(
                color: cardTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
