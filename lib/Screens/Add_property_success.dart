import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';

class Add_property_success extends StatefulWidget {

  @override
  _Add_property_successScreenState createState() => _Add_property_successScreenState();
}

class _Add_property_successScreenState extends State<Add_property_success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Text("SUCCESS!!!",
                          style: TextStyle(fontSize: 40.0,
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
                      child:
                      Text(
                        'Your property was added Successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,
                            fontSize: 26.0, fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
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
                            child: Text("View Properties",
                              style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),

                          Icon(Icons.arrow_forward,color: Colors.white,size: 40,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}