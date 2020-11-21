import 'package:flutter/material.dart';

/// Creates custom shadow box
/// Must have an ancestor [child] widget.
class CustomBoxShadow extends StatelessWidget {
  final Widget child;
  CustomBoxShadow({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      padding: EdgeInsets.only(left: 10.0, top: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}