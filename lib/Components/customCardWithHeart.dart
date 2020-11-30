import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/contactButton.dart';

/*
* custom card class created to display information about
* homes and apartments*/
class CustomCardWithHeart extends StatefulWidget {
  @override
  _CustomCardWithHeartState createState() => _CustomCardWithHeartState();

  final AssetImage imageNathan;
  final AssetImage imageBed;
  final  AssetImage imageBath;
  final AssetImage imageCarFill;

  /*
  * constructor for the class
  * @params imageNathan - image for the background
  * @param imageBed - image representing bed
  * @param imageBath - image representing bathhouses
  * @param imageCarFill -  image representing car parks*/
  CustomCardWithHeart({Key key, @required this.imageNathan, @required this.imageBed, @required this.imageBath, @required this.imageCarFill});
}

class _CustomCardWithHeartState extends State<CustomCardWithHeart> {

  final _price = "1756";
  final _buildingDescription = "Three Bedroom Apartment";
  final _buildingLocation = "23 Cresent Street, Mamprobi";

  final _numberOfBedrooms = "3 bed";
  final _numberOfBathhouses = "2 bath";
  final _numberOfParking = "2 parking";

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 28.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.imageNathan
                    ),
                  ),
                ),
                SizedBox(height: 5.0,),
                Container(
                  padding: EdgeInsets.only(left:15.0) ,
                  child: Text(
                    "GHS" + _price + "/month",
                    style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'Futura'
                    ),
                  ),
                ),
                Divider(thickness: 1.0,),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(_buildingDescription,
                    style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 17.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                SizedBox(height: 4.0,),
                Container(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(_buildingLocation,
                    style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w100
                    ),),
                ),
                SizedBox(height: 12.0,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20.0, left: 15.0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8.0),
                              child: Image(
                                image: widget.imageBed,
                              ),
                            ),
                            Text(
                              _numberOfBedrooms,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            Container(
                              child: Image(image: widget.imageBath),
                              margin: EdgeInsets.only(right: 8.0),),
                            Text(_numberOfBathhouses)
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Image(image: widget.imageCarFill),
                              margin: EdgeInsets.only(right: 8.0),),
                            Text(_numberOfParking)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]
          ),
          Positioned(
            top: 10.0,
            left: 20,
            right: 10,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0)
                        )
                      ),
                      height: 25.0,
                      width: 80.0,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              "Furnished",
                            textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0
                          ),),
                        ),
                    margin: EdgeInsets.only(right: 10.0),),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)
                          )
                      ),
                      height: 25.0,
                      width: 80.0,
                        child: Container(
                            child: Text(
                                "Pet friendly",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0
                              ),),
                          alignment: Alignment.center,
                        ),
                    )
                  ],
                ),
              ),
              Image(
                image: AssetImage("assets/Heart.png"),
              )
            ],
          ),),
          Positioned(
            top: 153,
            left: 210,
              child: ContactButton(),
          )
        ],
      ),
    );
  }
}