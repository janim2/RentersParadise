import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/customCard.dart';
import 'package:rentersparadise/Components/searchTextBox.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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
      padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      children: [
        Container(
          padding: EdgeInsets.only(top: 15.0),
          child: SearchTextBox(labelText: "Search Properties, Area etc ..."),
        ),
        SizedBox(height: 15.0,),
        ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return CustomCard(
                imageNathan: _imageNathan,
                imageBed: _imageBed,
                imageBath: _imageBath,
                imageCarFill: _imageCarFill,
              );
            })
      ],
    );
  }
}