import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/CustomBoxShadow.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Screens/account/Usersignin.dart';

class ProceedRegistration extends StatefulWidget {
  @override
  _ProceedRegistrationState createState() => _ProceedRegistrationState();
}

class _ProceedRegistrationState extends State<ProceedRegistration> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(0),
                elevation: 7,
                child: Container(
                  height: screenHeight / 8,
                  width: screenWidth,
                  color: TheColors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.arrow_back,
                              color: Colors.white, size: 30),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => UserSignIn()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Image.asset(
                "assets/logo.png",
                width: 200,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Please Register:",
                      style: TextStyle(
                          color: TheColors.violet,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomBoxShadow(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomBoxShadow(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomBoxShadow(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 40),
              RaisedButton(
                color: TheColors.orange,
                onPressed: () {},
                child: SizedBox(
                  width: screenWidth - 70,
                  height: 60,
                  child: Center(
                    child: Text(
                      "Register",
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
            ],
          ),
        ),
      ),
    );
  }
}