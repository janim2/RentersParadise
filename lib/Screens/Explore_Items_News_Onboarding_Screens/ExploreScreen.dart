import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/BottomAppBarButton.dart';
import 'package:rentersparadise/Components/PropertyCardTypes.dart';
import 'package:rentersparadise/Components/TheColors.dart';
//import 'package:rentersparadise/Screens/Explore_Item_News_Onboarding_Screens/IntroScreens.dart';
import 'package:rentersparadise/Components/SubTitle.dart';


Color lightDefaultColor = Color(0xFFEE892F);

const kMaximumSliderValue = 10000000.0;
const kMinimumSliderValue = 0.0;

const activeCardColor = Color(0xFFEE892F);
const activeCardTextColor = Colors.white;

const inActiveCardColor = Color(0xFFEDEDED);
const inActiveCardTextColor = Colors.grey;

enum Cards {
  Houses,
  Apartments,
  Duplex,
  Semi_Detached,
  Villas,
  Storey,
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int price = 5000000;

  Cards selectedCard;

  List<ListItem> _dropdownItems = [
    ListItem(1, "Dansoman"),
    ListItem(2, "Brofoyedru"),
    ListItem(3, "Kotei"),
    ListItem(4, "Santasi")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 170),
            child: Text(
              listItem.name,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF8E8E8E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TheColors.orange,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {}),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'FILTERS',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: 'Aveniir'),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white24,
        elevation: 0,
        child: BottomAppBarButton(
          buttonText: 'Search',
          onPressed: () {
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          //  Reset
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top:20,right: 15),
              child: Text(
                'Reset',
                style: TextStyle(
                  color: TheColors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          //Please Select filters
          SubTitle(
            title: 'Please select filters:',
          ),

          //Location
          SubTitle(title: 'Location'),

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Material(
              shadowColor: Color(0xFFEAEAEA),
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ListItem>(
                    iconSize: 50,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: Color(0xFF322276),
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
              ),
            ),
          ),

          //Property Type
          SubTitle(title: 'Property Type'),
          SizedBox(
            height: 15,
          ),
          Wrap(
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

          // Price
          SubTitle(title: 'Price'),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: TheColors.orange,
              inactiveTrackColor: inActiveCardTextColor,
              trackHeight: 4,
              thumbColor: TheColors.orange,
              overlayColor: inActiveCardTextColor,
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
          )
        ],
      )),
    );
  }
}


