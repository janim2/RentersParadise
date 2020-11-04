import 'package:flutter/material.dart';

/*
* Generates a an input text box to be used across various
* screens that would need a search area.*/
class SearchTextBox extends StatelessWidget {
  final String labelText;

  SearchTextBox({Key key, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Material(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none
        ),
        elevation: 2.0,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search, color: Colors.black87,),
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none
            )
          ),
        ),
      ),
    );
  }
}
