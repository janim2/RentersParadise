import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Screens/account/PropertyOwnersignin.dart';
import 'package:rentersparadise/Screens/account/Usersignin.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background_image_02.png"),
          /*  colorFilter: ColorFilter.mode(
              Colors.transparent.withOpacity(0.2), BlendMode.dstATop), */
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80.0,
          ),
          Image.asset("assets/RENDERS-PARADISE-LOGO-1.png"),
          SizedBox(
            height: screenHeight / 7,
          ),
          Text(
            "What Do You Prefer",
            style: TextStyle(
                color: TheColors.violet,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: screenHeight / 10,
          ),
          RaisedButton(
            color: TheColors.orange,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => UserSignIn()));
            },
            child: SizedBox(
              width: 250,
              height: 85,
              child: Center(
                child: Text(
                  "VIEW PROPERTIES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          SizedBox(height: 50),
          RaisedButton(
            color: TheColors.orange,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PropertyOwnerSignIn()));
            },
            child: SizedBox(
              width: 250,
              height: 85,
              child: Center(
                child: Text(
                  "PROPERTY LISTING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        ],
      ),
    );
  }
}