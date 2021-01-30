part of 'select_property_images_cubit.dart';

@immutable
abstract class SelectPropertyImagesState {}

class SelectPropertyImagesInitial extends SelectPropertyImagesState {
  SelectPropertyImagesInitial();
}

class SelectPropertyImagesLoading extends SelectPropertyImagesState {
  SelectPropertyImagesLoading();
}


class SelectPropertyImagesLoaded extends SelectPropertyImagesState {
  final List<Asset> images;
  SelectPropertyImagesLoaded(this.images,);
}

class SelectPropertyImagesError extends SelectPropertyImagesState {
  final String error;
  SelectPropertyImagesError(this.error);
}
