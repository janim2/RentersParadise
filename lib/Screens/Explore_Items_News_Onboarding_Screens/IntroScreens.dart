import 'dart:async';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';
// import 'package:provider/provider.dart';
// import 'package:rentersparadise/Components/ConfirmButton.dart';
//import 'package:rentersparadise/Components/ConfirmButton.dart';
//import 'package:rentersparadise/Screens/DashboardScreen.dart';
// import 'package:rentersparadise/app_state/WalkThroughState.dart';

class IntroScreens extends StatefulWidget {
  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  // Color largeTextColor = Color(0xFF322276);
  Color smallTextColor = Color(0xFFA0A0A0);
  // Color activeIndicatorColor = Color(0xFFE67817);
  Color inactiveIndicatorColor = Color(0xFFC7C7C7);


  int currentIndex = 0;

  PageController _pageController =
      PageController(keepPage: false, initialPage: 0);
  final List<PictureAndText> items = [
    PictureAndText(
        pictureUrl: "assets/webaliser.jpg",
        largeText: "WELCOME",
        smallText:
            "Original with 1000 product from a lot of different people."),
    PictureAndText(
        pictureUrl: "assets/florian.jpg",
        largeText: "BUY YOUR DREAM HOME",
        smallText: "Get it at an affordable price"),
    PictureAndText(
        pictureUrl:
            "assets/digital-marketing.jpg",
        largeText: "COMFORT",
        smallText: "Original with 1000 product from a lot of people"),
  ];

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (_) {
      if (currentIndex <= 2) {
        _pageController.animateToPage(currentIndex,
            duration: Duration(seconds: 5), curve: Curves.easeIn);
        currentIndex++;
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    // final walkThroughState = Provider.of<WalkThroughState>(context);
    return Scaffold(
      body: Center(
        child: Container(
          // constraints: BoxConstraints.expand(),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     alignment: Alignment.bottomCenter,
          //     image: AssetImage('assets/abstract-architectural-background.png'),
          //     fit: BoxFit.contain,
          //   ),
          // ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),

              //Company Logo
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                child: Image.asset(
                  'assets/RENDERS-PARADISE-LOGO-1.png',
                ),
              ),

              //Center Onboarding Images
              Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 450,
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (_) {
                        _.disallowGlow();
                        return false;
                      },
                      child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (_) {
                            setState(() {
                              currentIndex = _;
                            });
                          },
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  // Space On Top Of  Image
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15),
                                    // padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 250,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  items[index].pictureUrl))),
                                    ),
                                  ),

                                  //The Short Dashes
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      for (int i = 0; i <= 2; i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Container(
                                            height: 5,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: currentIndex == i
                                                  ? TheColors.orange
                                                  : inactiveIndicatorColor,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                  // The Texts Section

                                  // SizedBox(
                                  //   height: 4,
                                  // ),
                                  Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 10),
                                        child: Text(
                                          items[index].largeText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: TheColors.violet,
                                              letterSpacing: 1,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Description Text
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    // verticalDirection: VerticalDirection.down,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Text(
                                          items[index].smallText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: smallTextColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  //Forward Button
                  ConfirmButton(
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PictureAndText {
  String largeText;
  String smallText;
  String pictureUrl;

  PictureAndText({this.pictureUrl, this.largeText, this.smallText});
}


class ConfirmButton extends StatelessWidget {

  ConfirmButton({this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Padding(
        padding: EdgeInsets.only(left: 35,right: 35,bottom: 15),
        // padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Material(
          color:Color(0xFFEE892F),
          borderRadius: BorderRadius.circular(4.0),
          elevation: 5.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset('assets/Group147.png'),
              Padding(
                padding: const EdgeInsets.all(5),
                child:
                  Icon(
                    Icons.arrow_forward,
                    size: 50,
                    color: Colors.white,
                  ),
                //Image.asset('assets/Group147.png'),

              ),
            ],
          ),
        ),

      ),
    );
  }
}
