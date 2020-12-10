import 'package:flutter/material.dart';
import 'package:rentersparadise/src/constants/general_constants.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';
import 'package:rentersparadise/src/enums/cards.dart';
import 'package:rentersparadise/src/views/components/bottom_appbar_button.dart';
import 'package:rentersparadise/src/views/components/property_card_types.dart';

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
            onPressed: () {
              Navigator.of(context).pop();
            }),
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SafeArea(
              child: Column(
            children: <Widget>[
              //  Reset
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 20, right: 15),
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

              // Price
              SubTitle(title: 'Price'),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: TheColors.orange,
                  inactiveTrackColor: inActiveCardTextColor,
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
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  SubTitle({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, top: 30),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          color: TheColors.violet,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
