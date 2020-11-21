import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/BottomAppBarButton.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Components/SubTitle.dart';
import 'package:rentersparadise/Components/PropertyCardTypes.dart';
import 'package:rentersparadise/Screens/Explore_Items_News_Onboarding_Screens/AddPropertyScreen3.dart';
import 'package:rentersparadise/Screens/PropertyOwnerDashboardScreen.dart';

const kMaximumSliderValue = 10000000.0;
const kMinimumSliderValue = 0.0;

const activeCardColor = Color(0xFFEE892F);
const activeCardTextColor = Colors.white;

const inActiveCardColor = Color(0xFFEDEDED);
const inActiveCardTextColor = Colors.grey;

const kCardTextStyle =
TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.w500);

enum Cards {
  Houses,
  Apartments,
  Duplex,
  Semi_Detached,
  Villas,
  Storey,
}

enum typeOptions {
  Rent,
  Sales,
}

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
                      selectedCard = Cards.Houses;
                    });
                  },
                  cardTextColor: selectedCard == Cards.Houses
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.Houses
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Apartments',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.Apartments;
                    });
                  },
                  cardTextColor: selectedCard == Cards.Apartments
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.Apartments
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Duplex',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.Duplex;
                    });
                  },
                  cardTextColor: selectedCard == Cards.Duplex
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.Duplex
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Semi Detached',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.Semi_Detached;
                    });
                  },
                  cardTextColor: selectedCard == Cards.Semi_Detached
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.Semi_Detached
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Villas',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.Villas;
                    });
                  },
                  cardTextColor: selectedCard == Cards.Villas
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.Villas
                      ? activeCardColor
                      : inActiveCardColor,
                ),
                PropertyCardType(
                  cardText: 'Storey',
                  onPress: () {
                    //Change the Background Color of the Card and Text in Card
                    setState(() {
                      selectedCard = Cards.Storey;
                    });
                  },
                  cardTextColor: selectedCard == Cards.Storey
                      ? activeCardTextColor
                      : inActiveCardTextColor,
                  cardTypeColor: selectedCard == Cards.Storey
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
              cursorColor:TheColors.orange,
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