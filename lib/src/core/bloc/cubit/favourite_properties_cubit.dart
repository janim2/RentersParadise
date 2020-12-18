import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rentersparadise/src/core/models/property_model.dart';
import 'package:rentersparadise/src/core/services/fetch_favorite_properties.dart';

part 'favourite_properties_state.dart';

class FavouritePropertiesCubit extends Cubit<FavouritePropertiesState> {
  FavouritePropertiesCubit() : super(FavouritePropertiesInitial());

  List<Properties> _propertiesList = [];

  Future<void> loadFavouriteProperties() async {
    try {
      emit(FavouritePropertiesLoading());
      FetchFavoriteProperties.getFavoriteProperties().listen((event) {
        _propertiesList = event;
      });
      emit(FavouritePropertiesLoaded(_propertiesList));
    } on Exception {
      emit(FavouritePropertiesError("Check your connection"));
    }
  }
}
