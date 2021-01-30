import 'package:flutter/material.dart';
import 'package:rentersparadise/src/core/bloc/app_properties_bloc.dart';
import 'package:rentersparadise/src/views/components/custom_card.dart';
import 'package:rentersparadise/src/views/components/search_textbox.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // declaring image types to be rendered on the custom card class
  NetworkImage _imageNathan;
  AssetImage _imageBed;
  AssetImage _imageBath;
  AssetImage _imageCarFill;

  @override
  void initState() {
    super.initState();
    // loading the images used on the custom cards
    _imageNathan = NetworkImage('https://firebasestorage.googleapis.com/v0/b/rentersparadise-165af.appspot.com/o/property_images%2FIMG_20201219_235914.jpg?alt=media&token=fdf5c901-62a2-49b1-9dca-f74c0e50b756,https://firebasestorage.googleapis.com/v0/b/rentersparadise-165af.appspot.com/o/property_images%2FJPEG_20201219_162924_1988978474.jpg?alt=media&token=53f0dbce-f6a2-4be1-8f17-f3e6cc48724a');
    _imageBed = AssetImage('assets/bed-1.png');
    _imageBath = AssetImage('assets/bath.png');
    _imageCarFill = AssetImage('assets/car-fill-from-frontal-view-1.png');

    appBloc.updateTitle('EXPLORE');
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
        SizedBox(
          height: 15.0,
        ),
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
