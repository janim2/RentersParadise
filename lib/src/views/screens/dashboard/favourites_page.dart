import 'package:flutter/material.dart';
import 'package:rentersparadise/src/core/bloc/app_properties_bloc.dart';
import 'package:rentersparadise/src/views/components/custom_card_with_heart.dart';


class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  AssetImage _imageFlorian;
  Image _imageGroup9;

  // declaring image types to be rendered on the custom card class
  AssetImage _imageNathan;
  AssetImage _imageBed;
  AssetImage _imageBath;
  AssetImage _imageCarFill;

  @override
  void initState() {
    super.initState();

    _imageFlorian = AssetImage('assets/florian-schmidinger-b_79nOqf95I-unsplash.jpg');
    _imageGroup9 = Image.asset('assets/Group 9.png');

    // loading the images used on the custom cards
    _imageNathan = AssetImage('assets/nathan-fertig-FBXuXp57eM0-unsplash.jpg');
    _imageBed = AssetImage('assets/bed-1.png');
    _imageBath = AssetImage('assets/bath.png');
    _imageCarFill = AssetImage('assets/car-fill-from-frontal-view-1.png');

    appBloc.updateTitle('FAVOURITES');

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
    return  ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(left:20.0, right:20.0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomCardWithHeart(
              imageNathan: _imageNathan,
              imageBed: _imageBed,
              imageBath: _imageBath,
              imageCarFill: _imageCarFill,
            ),
          ],
        );
      },
      physics: ScrollPhysics(),);
  }
}