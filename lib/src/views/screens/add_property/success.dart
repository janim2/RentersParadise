import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/views/screens/property_owner_dashboard.dart';

class AddPropertySuccess extends StatefulWidget {
  @override
  _AddPropertySuccessScreenState createState() =>
      _AddPropertySuccessScreenState();
}

class _AddPropertySuccessScreenState extends State<AddPropertySuccess> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
        backgroundColor: TheColors.violet,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/success_one.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/orange_tick.png"),
                    width: 170,
                    height: 170,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "SUCCESS!!!",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: "Futura",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your property was added Successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertyOwnerDashboard()),
                          ModalRoute.withName("/Home"));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Container(
                        margin: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(8.0),
                          color: TheColors.orange,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "View Properties",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 40,
                              )
                            ],
                          ),
                        ),
                      ),
                      //constraints: BoxConstraints.expand(),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/success_two.png"),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomRight),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
