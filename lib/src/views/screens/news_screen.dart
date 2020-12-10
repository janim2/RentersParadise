import 'package:flutter/material.dart';
import 'package:rentersparadise/src/constants/the_colors.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int currentIndex = 0;

  onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
              elevation: 70,
              currentIndex: currentIndex,
              onTap: onTapped,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: TheColors.orange,
              items: [
                BottomNavigationBarItem(
                    activeIcon: ImageIcon(
                      AssetImage("assets/home_icon.png"),
                      color: TheColors.orange,
                      size: 30.0,
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/home_icon.png"),
                      color: Colors.grey,
                      size: 30.0,
                    ),
                    label: '',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    activeIcon: ImageIcon(
                      AssetImage("assets/plus_icon.png"),
                      color: TheColors.orange,
                      size: 30.0,
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/plus_icon.png"),
                      color: Colors.grey,
                      size: 30.0,
                    ),
                    label: '',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    activeIcon: ImageIcon(
                      AssetImage("assets/document_icon.png"),
                      color: TheColors.orange,
                      size: 30.0,
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/document_icon.png"),
                      color: Colors.grey,
                      size: 30.0,
                    ),
                    label: '',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    activeIcon: ImageIcon(
                      AssetImage("assets/Notification.png"),
                      color: TheColors.orange,
                      size: 30.0,
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/Notification.png"),
                      color: Colors.grey,
                      size: 30.0,
                    ),
                    label: '',
                    backgroundColor: Colors.white),
              ]),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              //Background Image with Text Overlay
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 290,
                    ),
                    Container(
                      color: Colors.black26,
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'News',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        height: 15,
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      color: Colors.black26,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                      child: Text(
                        'Renters Paradise Launches New App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
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
              ),

              Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),

                  //Row of Features and their Quantity and Description
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Text(
                          "Futures, stocks, and spot currency trading have large potential rewards, but also large potential"
                          " risk. You must be aware of the risks and be willing to accept them in order to trade in the futures, stocks,"
                          " and forex markets. Never trade with money you can’t afford to lose. This publication is neither a solicitation nor an "
                          "offer to Buy/Sell futures, stocks or forex. The information is for educational purposes only. No "
                          "representation is being made that any account will or is likely to achieve profits or losses similar to those "
                          "discussed in this publication. Past performance of indicators or methodology are not necessarily indicative "
                          "of future results.",
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
            ],
          ),

          //The Back Arrow of the Page
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFFEE892F),
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
