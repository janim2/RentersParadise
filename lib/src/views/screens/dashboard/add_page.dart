import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:rentersparadise/src/constants/general_constants.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/core/bloc/app_properties_bloc.dart';
import 'package:rentersparadise/src/core/bloc/cubit/select_property_images_cubit.dart';
import 'package:rentersparadise/src/views/screens/add_property/second_screen.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int price = 1000000;

  List<Asset> _selectedImages = [];

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
        body: Container(
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
                          height: 300,
                          width: MediaQuery.of(context).size.width * 0.95,
                          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          child: Expanded(
                            child: DottedBorder(
                                color: TheColors.orange,
                                strokeWidth: 1,
                                child: BlocBuilder<SelectPropertyImagesCubit,
                                        SelectPropertyImagesState>(
                                    builder: (context, state) {
                                  if (state is SelectPropertyImagesInitial) {
                                    return Center(
                                      child: GestureDetector(
                                          child: Text(
                                            "ADD PHOTO",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: TheColors.orange),
                                          ),
                                          onTap: () {}),
                                    );
                                  } else if (state
                                      is SelectPropertyImagesLoading) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state
                                      is SelectPropertyImagesLoaded) {
                                    if (state.images.length <= 0) {
                                      return Center(
                                        child: GestureDetector(
                                          child: Text(
                                            "ADD PHOTO",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: TheColors.orange),
                                          ),
                                          onTap: sipc.loadImages,
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        _selectedImages = state.images;
                                      });
                                      return imageGridView(state.images);
                                    }
                                  } else if (state
                                      is SelectPropertyImagesError) {
                                    return Center(
                                      child: Text("${state.error}"),
                                    );
                                  } else {
                                    return Center(
                                      child: GestureDetector(
                                          child: Text(
                                            "ADD PHOTO",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: TheColors.orange),
                                          ),
                                          onTap: () {}),
                                    );
                                  }
                                })),
                          ),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddPropertyScreen2()));
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
            )));
  }

  @override
  void initState() {
    super.initState();
    appBloc.updateTitle('ADD PROPERTY');
  }
}
