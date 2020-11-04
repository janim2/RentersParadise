import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/customCard.dart';
import 'package:rentersparadise/Components/searchTextBox.dart';

class HomeOwnerPage extends StatefulWidget {
  @override
  _HomeOwnerPageState createState() => _HomeOwnerPageState();
}

class _HomeOwnerPageState extends State<HomeOwnerPage> {
  // declaring image types to be rendered on the custom card class
  AssetImage _imageNathan;
  AssetImage _imageBed;
  AssetImage _imageBath;
  AssetImage _imageCarFill;

  @override
  void initState() {
    super.initState();

    // loading the images used on the custom cards
    _imageNathan = AssetImage('assets/nathan-fertig-FBXuXp57eM0-unsplash.jpg');
    _imageBed = AssetImage('assets/bed-1.png');
    _imageBath = AssetImage('assets/bath.png');
    _imageCarFill = AssetImage('assets/car-fill-from-frontal-view-1.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

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
              image: DecorationImage(
                  image: AssetImage('assets/sean-pollock-PhYq704ffdA-unsplash.jpg'),
                  fit: BoxFit.cover)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15.0, right: 10.0),
                        child: SearchTextBox(labelText: "Search Properties...")),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        child: Image.asset('assets/Group 9.png'),
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.only(top: 30.0),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 15.0),
                padding: EdgeInsets.only(top: 45.0),
                child: Text(
                  "Rent Out Your",
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Poppins',
                      color: Colors.white
                  ),),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0),
                child: Text("Property Today",
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Poppins',
                      color: Colors.white
                  ),),
              )
            ],
          ),
        ),
        SizedBox(height: 25.0),
        Row(
          children: [
            Text(
                "My Properties",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24.0,
              color: Colors.indigo,
            ),),
            Icon(Icons.add_box_rounded,color: Colors.indigo,)
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left:15.0, right:15.0),
          itemCount: 20,
          itemBuilder: (context, index) {
            return CustomCard(
              imageNathan: _imageNathan,
              imageBed: _imageBed,
              imageBath: _imageBath,
              imageCarFill: _imageCarFill,
            );
          },
          physics: ScrollPhysics(),)
      ],
    );
  }
}
