import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

part 'select_property_images_state.dart';

class SelectPropertyImagesCubit extends Cubit<SelectPropertyImagesState> {
  SelectPropertyImagesCubit() : super(SelectPropertyImagesInitial());

  List<Asset> _images = [];
  String error = "No errors";

  Future<List<Asset>> loadImages() async {
    try {
      _images = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          statusBarColor: "#FA8223",
          actionBarColor: "#FA8223",
          actionBarTitle: "Select photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      emit(SelectPropertyImagesLoaded(_images));
    } catch (e) {
      error = e.toString();
    }
    return _images;
  }

  Future<void> loadImagesFromDevice() async {
    try {
      emit(SelectPropertyImagesInitial());
      emit(SelectPropertyImagesLoading());
      emit(SelectPropertyImagesLoaded(_images));
    } on Exception {
      emit(SelectPropertyImagesError(error));
    }
  }
}
