import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';

import 'DashboardUis/AddPage.dart';
import 'DashboardUis/FavouritesPage.dart';
import 'DashboardUis/HomePage.dart';
import 'DashboardUis/NewsPage.dart';
import 'DashboardUis/SearchPage.dart';
import 'DashboardUis/SettingsPage.dart';

class DashboardScreen extends StatefulWidget {

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int currentTabIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    SearchPage(),
    AddPage(),
    NewsPage(),
    FavouritesPage(),
    SettingsPage(),
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EXPLORE",
        style: TextStyle(fontSize: 27.0, fontFamily: "Aveniir",
            color: Colors.white),),
      ),
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        onTap: onTapped,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: TheColors.orange,
        items: [
          BottomNavigationBarItem(
//          icon: new Icon(Icons.home, color: Colors.black, size: 30.0,),
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
              title: new Text(''), backgroundColor: Colors.white),
          BottomNavigationBarItem(
              activeIcon: ImageIcon(
                AssetImage("assets/search_icon.png"),
                color: TheColors.orange,
                size: 30.0,
              ),
              icon: ImageIcon(
                AssetImage("assets/search_icon.png"),
                color: Colors.grey,
                size: 30.0,

              ),
              title: new Text(''), backgroundColor: Colors.white
          ),
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
              title: Text(''), backgroundColor: Colors.white
          ),
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
              title: Text(''), backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              activeIcon: ImageIcon(
                AssetImage("assets/heart_icon.png"),
                color: TheColors.orange,
                size: 30.0,
              ),
              icon: ImageIcon(
                AssetImage("assets/heart_icon.png"),
                color: Colors.grey,
                size: 30.0,

              ),
              title: Text(''), backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              activeIcon: ImageIcon(
                AssetImage("assets/setting_icon.png"),
                color: TheColors.orange,
                size: 30.0,
              ),
              icon: ImageIcon(
                AssetImage("assets/setting_icon.png"),
                color: Colors.grey,
                size: 30.0,

              ),
              title: Text(''), backgroundColor: Colors.white
          ),
        ],
      ),
    );
  }
}