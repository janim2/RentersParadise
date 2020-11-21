import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Helpers/app_properties_bloc.dart';
import 'package:rentersparadise/Screens/Explore_Items_News_Onboarding_Screens/IntroScreens.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/profile.png"),),
                      Column(
                        children: [
                          Text("Lee West", style: TextStyle(color: Colors.black, fontSize: 23, fontWeight:  FontWeight.bold, fontFamily: "Poppins"),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Mamprobi West",style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight:  FontWeight.bold, fontFamily: "Poppins"),),
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Newsletter & Notifications",
                    style: TextStyle(fontFamily: "Aveniir", fontSize: 17, color: Colors.black),
                  ),
                ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8.0,0,0),
                    child: Text(
                      "Enable notification via email",
                      style: TextStyle(fontFamily: "Aveniir", fontSize: 19, color: Colors.grey),
                    ),
                  ),
//                  Switch(
//
//                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    color: Colors.grey,
                    alignment: Alignment.topLeft,
                    image: AssetImage("assets/info.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text("Feedback", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                        Text("Give us your feedback", style: TextStyle(color: Colors.grey, fontSize: 17),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => IntroScreens()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      color: Colors.grey,
                      alignment: Alignment.topLeft,
                      image: AssetImage("assets/power.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),child: Text("Log out", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)),
                          Text("Log out from all devices", style: TextStyle(color: Colors.grey, fontSize: 17),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    color: Colors.grey,
                    alignment: Alignment.topLeft,
                    image: AssetImage("assets/shield.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),child: Text("Privacy", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)),
                        Text("Set your privacy mode", style: TextStyle(color: Colors.grey, fontSize: 17),)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    appBloc.updateTitle('SETTINGS');
  }
}