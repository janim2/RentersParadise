import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

/// This class is entry point to uploading images to
/// the firestore storage.
/// It shouldn't be instantiated.

class UploadImages {
  static List<String> imageUrls = [];
  static Future<dynamic> _uploadImage(Asset image) async {
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref('property_images').child(image.name);
    UploadTask uploadTask = firebaseStorageRef
        .putData((await image.getByteData()).buffer.asUint8List());
    TaskSnapshot taskSnapshot = await uploadTask;
    return taskSnapshot.ref.getDownloadURL();
  }

  static List<String> uploadImage(List<Asset> images) {
    for (var image in images) {
      _uploadImage(image)
          .then((downloadUrl) => {imageUrls.add(downloadUrl.toString())});
    }
    return imageUrls;
  }
}
