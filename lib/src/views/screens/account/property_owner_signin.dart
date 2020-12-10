import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/core/services/auth.dart';
import 'package:rentersparadise/src/views/components/custom_box_shadow.dart';
import 'package:rentersparadise/src/views/components/err_message.dart';
import 'package:rentersparadise/src/views/screens/account/registration.dart';
import 'package:rentersparadise/src/views/screens/property_owner_dashboard.dart';

Auth _auth = new Auth();

class PropertyOwnerSignIn extends StatefulWidget {
  @override
  _PropertyOwnerSignInState createState() => _PropertyOwnerSignInState();
}

class _PropertyOwnerSignInState extends State<PropertyOwnerSignIn> {
  bool showSpinner = false;

  String email;
  String password;

  Future signInUser({String email, String password}) async {
    try {
      var registeredUser = await _auth.signIn(email, password);

      if (registeredUser != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PropertyOwnerDashboard()));
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      setState(() {
        showSpinner = false;
      });
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ErrorMessage(
              contentText: '• No input field must be left empty.\n'
                  '\n'
                  '• Make sure to input the correct password \n'
                  '\n'
                  '• Make sure to input the correct email address',
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
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
                        "Please Sign in:",
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
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 20),
                CustomBoxShadow(
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
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
                SizedBox(height: 40),
                RaisedButton(
                  color: TheColors.orange,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    signInUser(
                      email: email,
                      password: password,
                    );
                  },
                  child: SizedBox(
                    width: screenWidth - 70,
                    height: 60,
                    child: Center(
                      child: Text(
                        "Sign in",
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
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Registration()));
                  },
                  child: Text(
                    "Or Register",
                    style: TextStyle(
                      color: TheColors.violet,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
