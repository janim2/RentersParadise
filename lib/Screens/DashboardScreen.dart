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

  /*
  * declared a variable to get the current state of the scaffold
  * which is called in the function to set the drawer to open
  * whenever the floating button is tapped in the home page screen.*/
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static openDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }

  int currentTabIndex = 0;
  List<Widget> tabs = [
    HomePage(openDrawer),
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
      key: scaffoldKey,
      appBar: currentTabIndex == 0 ? null : AppBar(
        title: Text("EXPLORE",
        style: TextStyle(fontSize: 27.0, fontFamily: "Poppins",
            color: Colors.white),),
      ),
      endDrawer: Drawer(
        child: Container(
          color: TheColors.orange,
          child: ListView(
            children: [
              Container(
                height: 45.0,
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child: Text("RENTERS PARADISE",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0
                ),),
              ),
              SizedBox(height: 25.0,),
              Divider(color: Colors.white,),
              SizedBox(height: 7.0,),
              drawerContents("Profile"),
              drawerContents("Settings"),
              drawerContents("FAQ"),
              drawerContents("About Us"),
              drawerContents("T's and C's"),
              drawerContents("Contact us"),
              drawerContents("Favorites"),
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 50.0),
                  subtitle: Text("LOGOUT", style:
                    TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Poppins'
                    ),),
                ),
              ))
            ],
          ),
        ),
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

  /*
  * returns a list tile centered in the middle with the text argument as the title
  */
  Widget drawerContents(String itemName) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 50.0),
      subtitle: Text(itemName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontFamily: 'Futura'
        ),
      ),
      onTap: () {},
    );
  }
}
