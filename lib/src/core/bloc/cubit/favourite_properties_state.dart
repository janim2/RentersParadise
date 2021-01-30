part of 'favourite_properties_cubit.dart';

@immutable
abstract class FavouritePropertiesState {}

class FavouritePropertiesInitial extends FavouritePropertiesState {
  FavouritePropertiesInitial();
}

class FavouritePropertiesLoading extends FavouritePropertiesState {
  FavouritePropertiesLoading();
}

class FavouritePropertiesLoaded extends FavouritePropertiesState {
  final List<Properties> list;
  FavouritePropertiesLoaded(this.list);
}

class FavouritePropertiesError extends FavouritePropertiesState {
  final String message;
  FavouritePropertiesError(this.message);
}
