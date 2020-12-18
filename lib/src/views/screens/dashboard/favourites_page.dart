import 'package:flutter/material.dart';
import 'package:rentersparadise/src/core/bloc/app_properties_bloc.dart';
import 'package:rentersparadise/src/core/bloc/cubit/favourite_properties_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentersparadise/src/core/models/property_model.dart';
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

    _imageFlorian =
        AssetImage('assets/florian-schmidinger-b_79nOqf95I-unsplash.jpg');
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
    final favouritepropertiesCubit = context.bloc<FavouritePropertiesCubit>();
    favouritepropertiesCubit.loadFavouriteProperties();

    return BlocBuilder<FavouritePropertiesCubit, FavouritePropertiesState>(
      builder: (context, state) {
        if (state is FavouritePropertiesInitial) {
          return initialFavouriteProperties();
        } else if (state is FavouritePropertiesLoading) {
          return loadingFavouriteProperties();
        } else if (state is FavouritePropertiesLoaded) {
          return loadedFavouriteProperties(state.list);
        } else if (state is FavouritePropertiesError) {
          return Center(
            child: Text("${state.message}"),
          );
        } else {
          return initialFavouriteProperties();
        }
      },
    );
  }

  // widget rendered during favouritePropertiesInitial State
  Widget initialFavouriteProperties() {
    return Center(
      child: Text("properties"),
    );
  }

  // widget rendered during favouritePropertiesLoading state
  Widget loadingFavouriteProperties() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // widget rendered during favouritePropertiesLoaded state
  Widget loadedFavouriteProperties(List<Properties> _propertiesList) {
    return ListView.builder(
        itemCount: _propertiesList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
            child: Column(
              children: [
                CustomCardWithHeart(
                  imageNathan: _imageNathan,
                  imageBed: _imageBed,
                  imageBath: _imageBath,
                  imageCarFill: _imageCarFill,
                  price: _propertiesList[index].price.toString(),
                  buildingDescription: _propertiesList[index].name,
                  buildingLocation: _propertiesList[index].location,
                  numberOfBathhouses: _propertiesList[index].bathroom.toString(),
                  numberOfBedrooms: _propertiesList[index].bedroom.toString(),
                  numberOfParking: _propertiesList[index].parking.toString(),
                ),
              ],
            ),
          );
        });
  }
}
