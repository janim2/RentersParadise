import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Helpers/app_properties_bloc.dart';
import 'package:rentersparadise/Screens/Add_Property.dart';
import 'package:rentersparadise/Screens/Explore_Items_News_Onboarding_Screens/AddPropertyScreen2.dart';


const inActiveCardColor = Color(0xFFEDEDED);
const inActiveCardTextColor = Color(0xFFC1C1C1);

const kMaximumSliderValue = 10000000.0;
const kMinimumSliderValue = 0.0;

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  int price = 1000000;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
//        appBar: AppBar(
//          title: Text("ADD PROPERTY",
//            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white, fontFamily: "Poppins"),),
//          leading: GestureDetector(
//              onTap: (){
//                Navigator.of(context).pop();
//              },child: Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
//          backgroundColor: TheColors.orange,
//        ),
        body: Container(
            color: Colors.white,
            height: double.maxFinite,
            child: new Stack(
              //alignment:new Alignment(x, y)
              children: <Widget>[
                new Positioned(
                  child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: TheColors.orange,
                            inactiveTrackColor: inActiveCardTextColor,
                            thumbColor: TheColors.orange,
                            overlayColor: inActiveCardTextColor,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: price.toDouble(),
                            min: kMinimumSliderValue,
                            max: kMaximumSliderValue,
                            //activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double value) {
                              setState(() {
                                price = value.round();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(31.0,0,0,0),
                          child: Align(alignment: Alignment.topLeft,child: Text("ADD PHOTO", style: TextStyle(color: TheColors.orange, fontFamily: "Aveniir", fontSize: 20),)),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Align(alignment: Alignment.topLeft,child: Padding(
                          padding: const EdgeInsets.fromLTRB(39.0,0,0,0),
                          child: Text("Please add photos: ", style: TextStyle(color: TheColors.violet, fontSize: 25, fontFamily: "Poppins"),),
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        DottedBorder(
                          color: TheColors.orange,
                          strokeWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(110.0, 60, 110, 80),
                            child: Text("ADD PHOTO", style: TextStyle(fontSize: 20, color: TheColors.orange), ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                new Positioned(
                  child: new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddPropertyScreen2()));
                      },
                      child: Container(
//          margin: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(1.0),
                          color: TheColors.orange,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Add Photos",
                                  style: TextStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
//                Icon(Icons.arrow_forward,color: Colors.white,size: 40,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ))) ;
  }

  @override
  void initState() {
    appBloc.updateTitle('ADD PROPERTY');
  }
}

