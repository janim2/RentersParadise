import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/core/services/auth.dart';
import 'package:rentersparadise/src/views/components/custom_box_shadow.dart';
import 'package:rentersparadise/src/views/components/err_message.dart';
import 'package:rentersparadise/src/views/screens/account/user_signin.dart';
import 'package:rentersparadise/src/views/screens/user_dashboard.dart';

Auth _auth = new Auth();

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool showSpinner = false;
  bool _proceedWithRegistration = false;

  String email;
  String password;
  String confirmPassword;

  Future registerUser(
      {String email, String password, String confirmPassword}) async {
    try {
      if (password == confirmPassword) {
        var newUser = await _auth.registration(email, password);
        if (newUser != null) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => UserDashboardScreen()));
        }
        setState(() {
          showSpinner = false;
        });
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return ErrorMessage(
                  contentText:
                      'Password and Confirm Password does not match. \n');
            });
        setState(() {
          showSpinner = false;
        });
      }
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
                  '• Password and Confirm  password must match and must be at least 6 characters long\n'
                  '\n'
                  '• Make sure to input a correct email address',
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UserSignIn()));
                            },
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
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
                Offstage(
                  offstage: _proceedWithRegistration,
                  child: Column(
                    children: [
                      CustomBoxShadow(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "First Name",
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
                          decoration: InputDecoration(
                            hintText: "Last Name",
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Residential Address",
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
                        onPressed: () {
                          setState(() {
                            _proceedWithRegistration = true;
                          });
                        },
                        child: SizedBox(
                          width: screenWidth - 70,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Proceed",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Icon(Icons.arrow_forward,
                                  color: Colors.white, size: 30)
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: !_proceedWithRegistration,
                  child: Column(
                    children: [
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
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
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
                          onChanged: (value) {
                            confirmPassword = value;
                          },
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
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });

                          registerUser(
                              email: email,
                              password: password,
                              confirmPassword: confirmPassword);
                        },
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
