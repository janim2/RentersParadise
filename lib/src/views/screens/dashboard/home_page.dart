import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/src/views/components/custom_card.dart';
import 'package:rentersparadise/src/views/components/search_textbox.dart';
import 'package:rentersparadise/src/views/screens/explore_screen.dart';
import 'package:rentersparadise/src/views/screens/property_screen.dart';

class HomePage extends StatefulWidget {
  final Function openDrawer;

  HomePage(this.openDrawer);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static final scaffoldKey = GlobalKey<ScaffoldState>();
  // static openDrawer() {
  //   scaffoldKey.currentState.openEndDrawer();
  // }

  AssetImage _imageFlorian;
  Image _imageGroup9;

  // declaring image types to be rendered on the custom card class
  AssetImage _imageNathan;
  AssetImage _imageBed;
  AssetImage _imageBath;
  AssetImage _imageCarFill;


  List properties = [];

  @override
  void initState() {
    super.initState();

    _imageFlorian =
        AssetImage('assets/florian-schmidinger-b_79nOqf95I-unsplash.jpg');
    _imageGroup9 = Image.asset('assets/Group 9.png');

    // loading the images used on the custom cards
    _imageNathan = AssetImage('assets/nathan-fertig-FBXuXp57eM0-unsplash.jpg');
    _imageBed = AssetImage('assets/bed-1.png');
    _imageBath = AssetImage('assets/bath.png');
    _imageCarFill = AssetImage('assets/car-fill-from-frontal-view-1.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(_imageGroup9.image, context);
    precacheImage(_imageFlorian, context);

    // caching the custom cards images
    precacheImage(_imageNathan, context);
    precacheImage(_imageBed, context);
    precacheImage(_imageBath, context);
    precacheImage(_imageCarFill, context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(image: _imageFlorian, fit: BoxFit.cover)),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ExploreScreen()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15.0, right: 10.0),
                          child:
                              SearchTextBox(labelText: "Search Properties...")),
                      InkWell(
                        onTap: () {
                          widget.openDrawer();
                          // openDrawer();
                        },
                        child: Container(
                          child: _imageGroup9,
                        ),
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(top: 30.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  padding: EdgeInsets.only(top: 45.0),
                  child: Text(
                    "Rent Smarter",
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Today",
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),
        SizedBox(
          height: 5.0,
        ),


 StreamBuilder(
    stream: FirebaseFirestore.instance.collection("properties").snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child:CircularProgressIndicator(),
        );
      } else { 
        
          properties = snapshot.data.documents;

          print(properties);

          return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          itemCount: properties.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PropertyScreen(
                      docId: properties[index].documentID,
                    )));
              },
              child: CustomCard(
                // properties[index]["picture"].toString()
                imageNathan: NetworkImage(properties[index]["picture"].toString()),
                imageBed: _imageBed,
                imageBath: _imageBath,
                imageCarFill: _imageCarFill,

                buildingDescription: properties[index]["name"],
                buildingLocation: properties[index]["location"],
                numberOfBathhouses: properties[index]["bathroom"],
                numberOfBedrooms: properties[index]["bedroom"],
                price: properties[index]["prize"],
                numberOfParking: properties[index]["parking"],
              ),
            );
          },
          physics: ScrollPhysics(),
        );
      }

        

    })
      ],
    );
  }
}
