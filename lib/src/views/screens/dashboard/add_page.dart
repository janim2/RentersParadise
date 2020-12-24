import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:rentersparadise/src/constants/general_constants.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/core/bloc/app_properties_bloc.dart';
import 'package:rentersparadise/src/core/bloc/cubit/select_property_images_cubit.dart';
import 'package:rentersparadise/src/core/services/upload_images.dart';
import 'package:rentersparadise/src/views/screens/add_property/second_screen.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int price = 1000000;
  bool showSpinner = false;
  List<Asset> _selectedImages = [];
  List<Asset> _images = [];
  String error = "No errors";

  Future<void> loadImages() async {
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
    } catch (e) {
      error = e.toString();
    }
    setState(() {
      _selectedImages = _images;
    });
  }

  Widget imageGridView(List<Asset> _images) {
    return GridView.count(
      crossAxisSpacing: 5.0,
      crossAxisCount: 3,
      children: List.generate(_images.length, (index) {
        Asset asset = _images[index];
        return AssetThumb(
          asset: asset,
          width: 250,
          height: 250,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sipc = context.bloc<SelectPropertyImagesCubit>();
    sipc.loadImagesFromDevice();
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
          color: Colors.white,
          height: double.maxFinite,
          child: new Stack(
            //alignment:new Alignment(x, y)
            children: <Widget>[
              new Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: TheColors.orange,
                          inactiveTrackColor: inActiveCardTextColor,
                          thumbColor: TheColors.orange,
                          overlayColor: inActiveCardTextColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: price.toDouble(),
                          min: kMinimumSliderValue,
                          max: kMaximumSliderValue,
                          //activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double value) {
                            setState(() {
                              price = value.round();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(31.0, 0, 0, 0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "ADD PHOTO",
                              style: TextStyle(
                                  color: TheColors.orange,
                                  fontFamily: "Aveniir",
                                  fontSize: 20),
                            )),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(39.0, 0, 0, 0),
                            child: Text(
                              "Please add photos: ",
                              style: TextStyle(
                                  color: TheColors.violet,
                                  fontSize: 25,
                                  fontFamily: "Poppins"),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 320,
                        width: MediaQuery.of(context).size.width * 0.95,
                        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        child: DottedBorder(
                            color: TheColors.orange,
                            strokeWidth: 1,
                            child: _selectedImages.length <= 0
                                ? Center(
                                    child: GestureDetector(
                                      child: Text(
                                        "ADD PHOTO",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: TheColors.orange),
                                      ),
                                      onTap: loadImages,
                                    ),
                                  )
                                : imageGridView(_selectedImages)),
                      ),
                    ],
                  ),
                ),
              ),
              new Positioned(
                child: new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      // call the upload method of the UploadImage class
                      var imageUrl = UploadImages.uploadImage(_selectedImages);
                      setState(() {
                        showSpinner = true;
                      });
                      if (imageUrl != null) {
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddPropertyScreen2(
                                  imageUrls: imageUrl,
                                )));
                      } else {
                        AlertDialog(title: Text("Failed to add images"));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(1.0),
                        color: TheColors.orange,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Add Photos",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    ));
  }

  @override
  void initState() {
    super.initState();
    appBloc.updateTitle('ADD PROPERTY');
  }

  @override
  void dispose() {
    super.dispose();
  }
}
