
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/BottomAppBarButton.dart';
import 'package:rentersparadise/Components/TheColors.dart';

const kTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20);

const sampleText = ("Futures, stocks, and spot currency trading have large potential rewards, but also large potential"
    " risk. You must be aware of the risks and be willing to accept them in order to trade in the futures, stocks,"
    " and forex markets. Never trade with money you can’t afford to lose. This publication is neither a solicitation nor an "
    "offer to Buy/Sell futures, stocks or forex. The information is for educational purposes only. No "
    "representation is being made that any account will or is likely to achieve profits or losses similar to those "
    "discussed in this publication. Past performance of indicators or methodology are not necessarily indicative "
    "of future results.");

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  double price = 800;
  final Color defaultIconColor = Colors.grey;
  final Color selectedIconColor = Color(0xFFEE892F);
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white24,
        elevation: 0,
        child: BottomAppBarButton(
          buttonText: 'Contact',
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  //Background Image with Text Overlay
                  BackgroundImageWithTextOverlay(price: price),

                  //The Scroll  View and the Features and Description Section
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 415,
                      ),
                      //Scroll View of Pictures
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            ImageWidget(
                              pictureUrl: "assets/aaron-huber.jpg",
                            ),
                            ImageWidget(
                                pictureUrl:
                                    "assets/francesca-tosolini-l43rLPXCP1M-unsplash.jpg"),
                            ImageWidget(pictureUrl: "assets/nathan-fertig.jpg"),
                            ImageWidget(
                                pictureUrl:
                                    "assets/francesca-tosolini-tHkJAMcO3QE-unsplash.jpg"),
                            ImageWidget(pictureUrl: "assets/florian.jpg"),
                          ],
                        ),
                      ),

                      //  SUB TITLE FEATURES
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          "Features",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      //Row of Features and their Quantity and Description
                      Column(
                        children: <Widget>[
                          FeatureAndQuantity(
                            featureName: "Bedroooms",
                            quantity: "4",
                          ),
                          SizedBox(height: 10),
                          FeatureAndQuantity(
                              featureName: "Bathrooms", quantity: "3"),
                          SizedBox(height: 10),
                          FeatureAndQuantity(
                              featureName: "Parking", quantity: "2"),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text(
                              "Descriptions",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Text(
                              sampleText,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  // The Love Icon
                  Padding(
                    padding: const EdgeInsets.only(top: 370, right: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          iconSize: 35,
                          color: _hasBeenPressed
                              ? selectedIconColor
                              : defaultIconColor,
                          onPressed: () => {
                            setState(() {
                              _hasBeenPressed = !_hasBeenPressed;
                            })
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //The Back Arrow of the Page
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: TheColors.orange,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureAndQuantity extends StatelessWidget {
  FeatureAndQuantity({@required this.featureName, @required this.quantity});

  final String featureName;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Text(
            featureName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Color(0xFFA0A0A0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Text(
            quantity,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Color(0xFFA0A0A0),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  ImageWidget({@required this.pictureUrl});

  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(pictureUrl),
          ),
        ),
      ),
    );
  }
}

class BackgroundImageWithTextOverlay extends StatelessWidget {
  const BackgroundImageWithTextOverlay({
    Key key,
    @required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 270,
          ),
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.black26,
            // top: 170,
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'GHS $price /month',
              textAlign: TextAlign.left,
              style: kTextStyle,
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            color: Colors.black26,
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'One Bedroom Apartment',
              style: kTextStyle,
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            color: Colors.black26,
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              '1 Leodel Street, Kasoa',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            color: Colors.black26,
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 22),
            child: Row(
              children: <Widget>[
                ImageAndText(
                  pictureUrl: "assets/bed-24.png",
                  text: ' 1 Bed',
                ),
                SizedBox(width: 10),
                ImageAndText(
                  pictureUrl: "assets/bath-24.png",
                  text: ' 1 Bath',
                ),
                SizedBox(width: 10),
                ImageAndText(
                  //I can't find this specific image in the UI Distribution archive
                  pictureUrl: "assets/bath-24.png",
                  text: ' 2 Parking',
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
      constraints: BoxConstraints.expand(height: 400),
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/nathan-fertig.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ImageAndText extends StatelessWidget {
  ImageAndText({@required this.pictureUrl, this.text});

  final String pictureUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(pictureUrl),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
