import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rentersparadise/Components/TheColors.dart';

class Add_Property extends StatefulWidget {

  @override
  _Add_PropertyPageState createState() => _Add_PropertyPageState();
}

class _Add_PropertyPageState extends State<Add_Property> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD PROPERTY",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white, fontFamily: "Poppins"),),
        leading: Icon(Icons.arrow_back,color: Colors.white,size: 40,),
        backgroundColor: TheColors.orange,
      ),
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
                    Align(alignment: Alignment.topLeft,child: Padding(
                      padding: const EdgeInsets.fromLTRB(39.0,0,0,0),
                      child: Text("Please add photos: ", style: TextStyle(color: TheColors.violet, fontSize: 25),),
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
      )
      ],
    ))) ;
  }
}