import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Components/SubTitle.dart';
import 'package:rentersparadise/Components/BottomAppBarButton.dart';
import 'package:rentersparadise/Screens/Add_property_success.dart';

const kMaximumSliderValue = 10000000.0;
const kMinimumSliderValue = 0.0;

const kDropDownMenuItemsTextStyle = TextStyle(
  fontSize: 20,
  color: Color(0xFF8E8E8E),
  fontWeight: FontWeight.bold,
);

class AddPropertyScreen3 extends StatefulWidget {
  @override
  _AddPropertyScreen3State createState() => _AddPropertyScreen3State();
}

class _AddPropertyScreen3State extends State<AddPropertyScreen3> {
  int price = 5000000;

  List<String> _locations = [
    "Dansoman",
    "Brofoyedru",
    "Santasi",
    "Kotei",
  ];

  List<String> _streetNames = [
    "21 Crescent Street",
    "13th Kwame Avenue",
    "Nkrumah Circle",
    "Norman-OK",
  ];

  List<String> _bedRoomQuantity = ["1", "2", "3", "4", "5"];

  List<String> _bathRoomQuantity = ["1", "2", "3", "4", "5"];

  List<String> _parkingQuantity = ["1", "2", "3", "4", "5"];

  String _selectedBathRoomQuantity;
  String _selectedParkingQuantity;
  String _selectedBedRoomQuantity;
  String _selectedStreetName;
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TheColors.orange,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Text(
            'ADD PROPERTY',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Aveniir'),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white24,
        elevation: 0,
        child: BottomAppBarButton(
          buttonText: 'Post Property',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Add_property_success()));
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // THE   SLIDER
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: TheColors.orange,
                inactiveTrackColor: Color(0xFFC1C1C1),
                trackHeight: 4,
                thumbColor: TheColors.orange,
                overlayColor: Color(0xFFC1C1C1),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
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

            //Add details text
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'ADD FEATURES',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: TheColors.orange,
                  ),
                ),
              ),
            ),

            //Location
            SubTitle(title: 'Location'),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Material(
                shadowColor: Color(0xFFEAEAEA),
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconSize: 50,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: Color(0xFF322276),
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 50),
                      child: Text(
                        'Please choose the Location',
                        style: kDropDownMenuItemsTextStyle,
                      ),
                    ),
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            location,
                            style: kDropDownMenuItemsTextStyle,
                          ),
                        ),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            //Street Name
            SubTitle(title: 'Street Name'),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Material(
                shadowColor: Color(0xFFEAEAEA),
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconSize: 50,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: Color(0xFF322276),
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 15),
                      child: Text(
                        'Please choose the Street Name',
                        style: kDropDownMenuItemsTextStyle,
                      ),
                    ),
                    value: _selectedStreetName,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedStreetName = newValue;
                      });
                    },
                    items: _streetNames.map((streetName) {
                      return DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            streetName,
                            style: kDropDownMenuItemsTextStyle,
                          ),
                        ),
                        value: streetName,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            //Property Features
            SubTitle(title: 'Property Features'),
            SizedBox(
              height: 5,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25),
                      child: Text(
                        "Bedroom",
                        style: kDropDownMenuItemsTextStyle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Material(
                        shadowColor: Color(0xFFEAEAEA),
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconSize: 30,
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor: Color(0xFF322276),
                            // hint: Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   child: Text(
                            //     ' No.',
                            //     style: kDropDownMenuItemsTextStyle,
                            //   ),
                            // ),
                            value: _selectedBedRoomQuantity,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedBedRoomQuantity = newValue;
                              });
                            },
                            items: _bedRoomQuantity.map((quantity) {
                              return DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    quantity,
                                    style: kDropDownMenuItemsTextStyle,
                                  ),
                                ),
                                value: quantity,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Bathroom",
                        style: kDropDownMenuItemsTextStyle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Material(
                        shadowColor: Color(0xFFEAEAEA),
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconSize: 30,
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor: Color(0xFF322276),
                            // hint: Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   child: Text(
                            //     ' No.',
                            //     style: kDropDownMenuItemsTextStyle,
                            //   ),
                            // ),
                            value: _selectedBathRoomQuantity,
                            onChanged: (value) {
                              setState(() {
                                _selectedBathRoomQuantity = value;
                              });
                            },
                            items: _bathRoomQuantity.map((quantity) {
                              return DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    quantity,
                                    style: kDropDownMenuItemsTextStyle,
                                  ),
                                ),
                                value: quantity,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 35),
                      child: Text(
                        "Parking",
                        style: kDropDownMenuItemsTextStyle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Material(
                        shadowColor: Color(0xFFEAEAEA),
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconSize: 30,
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor: Color(0xFF322276),
                            // hint: Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   child: Text(
                            //     ' No.',
                            //     style: kDropDownMenuItemsTextStyle,
                            //   ),
                            // ),
                            value: _selectedParkingQuantity,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedParkingQuantity = newValue;
                              });
                            },
                            items: _parkingQuantity.map((quantity) {
                              return DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    quantity,
                                    style: kDropDownMenuItemsTextStyle,
                                  ),
                                ),
                                value: quantity,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //Price
            SubTitle(title: 'Price'),
            PriceInputField(),

          ],
        ),
      ),
    );
  }
}

class PriceInputField extends StatelessWidget {
  const PriceInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 200, top: 10,bottom: 18),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(5),
          child: Center(
            child: TextField(
              cursorColor:TheColors.orange,
              decoration: InputDecoration(
                hintText: " Enter Price",
                hintStyle: kDropDownMenuItemsTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ),
      ),
    );
  }
}