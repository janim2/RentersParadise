import 'package:flutter/material.dart';
import 'package:rentersparadise/Components/TheColors.dart';
import 'package:rentersparadise/Helpers/app_properties_bloc.dart';
import 'package:rentersparadise/Screens/DashboardUis/AddPage.dart';
import 'package:rentersparadise/Screens/DashboardUis/HomeOwnerPage.dart';
import 'package:rentersparadise/Screens/DashboardUis/NewsPage.dart';
import 'package:rentersparadise/Screens/DashboardUis/Notifications.dart';
import 'package:rentersparadise/Screens/Explore_Items_News_Onboarding_Screens/IntroScreens.dart';
import 'package:rentersparadise/services/auth.dart';


Auth _auth =new Auth();


class PropertyOwnerDashboardScreen extends StatefulWidget {
  @override
  _PropertyOwnerDashboardScreenState createState() => _PropertyOwnerDashboardScreenState();
}

class _PropertyOwnerDashboardScreenState extends State<PropertyOwnerDashboardScreen> {

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
    HomeOwnerPage(openDrawer),
//    SearchPage(),
    AddPage(),
    NewsPage(),
//    FavouritesPage(),
//    SettingsPage(),
    Notifications(),
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
        title: StreamBuilder<Object>(
            stream: appBloc.titleStream,
            initialData: "HOME",
            builder: (context, snapshot) {
              return Text(snapshot.data,style: TextStyle(fontSize: 27.0, fontFamily: "Poppins",
                  color: Colors.white),);
            }
        ),
        automaticallyImplyLeading: false,

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
              GestureDetector(
                onTap:(){
                  //Implementing logout functionality
                  _auth.signOut();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => IntroScreens()));
                },
                child: Expanded(child: Align(
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
                )),
              )
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
             label: '', backgroundColor: Colors.white),
//          BottomNavigationBarItem(
//              activeIcon: ImageIcon(
//                AssetImage("assets/search_icon.png"),
//                color: TheColors.orange,
//                size: 30.0,
//              ),
//              icon: ImageIcon(
//                AssetImage("assets/search_icon.png"),
//                color: Colors.grey,
//                size: 30.0,
//
//              ),
//             label: '', backgroundColor: Colors.white
//          ),
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
             label: '', backgroundColor: Colors.white
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
             label: '', backgroundColor: Colors.white
          ),
//          BottomNavigationBarItem(
//              activeIcon: ImageIcon(
//                AssetImage("assets/heart_icon.png"),
//                color: TheColors.orange,
//                size: 30.0,
//              ),
//              icon: ImageIcon(
//                AssetImage("assets/heart_icon.png"),
//                color: Colors.grey,
//                size: 30.0,
//
//              ),
//             label: '', backgroundColor: Colors.white
//          ),
//          BottomNavigationBarItem(
//              activeIcon: ImageIcon(
//                AssetImage("assets/setting_icon.png"),
//                color: TheColors.orange,
//                size: 30.0,
//              ),
//              icon: ImageIcon(
//                AssetImage("assets/setting_icon.png"),
//                color: Colors.grey,
//                size: 30.0,
//
//              ),
//             label: '', backgroundColor: Colors.white
//          ),
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
             label: '', backgroundColor: Colors.white
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
      onTap: () {
        //Implementing logout functionality
        _auth.signOut();
      },
    );
  }
}
