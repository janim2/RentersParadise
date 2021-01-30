import 'package:flutter/material.dart';
import 'package:rentersparadise/src/constants/general_constants.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/enums/cards.dart';
import 'package:rentersparadise/src/views/components/bottom_appbar_button.dart';
import 'package:rentersparadise/src/views/components/property_card_types.dart';
import 'package:rentersparadise/src/views/components/subtitle.dart';
import 'package:rentersparadise/src/views/screens/add_property/third_screen.dart';

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class AddPropertyScreen2 extends StatefulWidget {
  @override
  _AddPropertyScreen2State createState() => _AddPropertyScreen2State();
}

class _AddPropertyScreen2State extends State<AddPropertyScreen2> {
  int price = 5000000;
  Cards selectedCard;
  int selectedRadio;

  // Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
          buttonText: 'Continue',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AddPropertyScreen3()));
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),

            // THE SLIDER
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
              alignment: Alignment.center,
              child: Text(
                'ADD DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: TheColors.orange,
                ),
              ),
            ),

            //Type
            SubTitle(title: 'Type'),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: TheColors.orange,
                  onChanged: (val) {
                    //print("Radio $val");
                    setSelectedRadio(val);
                  },
                ),
                Text(
                  'For Rent',
                  style: kCardTextStyle,
                ),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: TheColors.orange,
                  onChanged: (val) {
                    //print("Radio $val");
                    setSelectedRadio(val);
                  },
                ),
                Text(
                  'For Sale',
                  style: kCardTextStyle,
                )
              ],
            ),

            //Property Type
            SubTitle(title: 'Property Type'),
            SizedBox(
              height: 18,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                PropertyCardType(
                  cardText: 'Houses',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.HOUSES;
                    });
                  },
                  cardTextColor: selectedCard == Cards.HOUSES
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.HOUSES
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Apartments',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.APARTMENTS;
                    });
                  },
                  cardTextColor: selectedCard == Cards.APARTMENTS
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.APARTMENTS
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Duplex',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.DUPLEX;
                    });
                  },
                  cardTextColor: selectedCard == Cards.DUPLEX
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.DUPLEX
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Semi Detached',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.SEMI_DETACHED;
                    });
                  },
                  cardTextColor: selectedCard == Cards.SEMI_DETACHED
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.SEMI_DETACHED
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Villas',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.VILLAS;
                    });
                  },
                  cardTextColor: selectedCard == Cards.VILLAS
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.VILLAS
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Storey',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.STOREY;
                    });
                  },
                  cardTextColor: selectedCard == Cards.STOREY
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.STOREY
                      ? activeCardColor
                      : inActiveCardColor,
                ),
              ],
            ),

            //Property Details
            SubTitle(title: 'Property Details'),
            PropertyDetailsInputField(),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}

class PropertyDetailsInputField extends StatelessWidget {
  const PropertyDetailsInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 40,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(5),
          child: Center(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              cursorColor: TheColors.orange,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    width: 2,
                    color: TheColors.orange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(
                    width: 2,
                    color: TheColors.orange,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
