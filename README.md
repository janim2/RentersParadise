# rentersparadise

A new Flutter application.

##The Rules Of The Master (Branch)

#All UI components and screens have been zipped in a file called UI_components_and_screens.

In the components folder There is the "TheColors.dart" file for colors

I have created a folder called assets in rentersparadise folder. we'll keep all the assets in the app here

inside pubspec.yaml I have added the whole folder like so

  assets:
    - assets/

DO NOT add any assets here like

- assets/a_dot_ham.jpeg

to use an assets just add it to the assets folder ( Or Create sub Folder in this folder) and use it like

AssetImage("assets/yourImage.png")

also in the pubspec.yaml file I have added a package called provider

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.3
  provider:

Important (The Provider Package)

we'll be using provider for state management

    1. Create a Class To Manage your state

import 'package:flutter/material.dart';

class WalkThroughState extends ChangeNotifier{

// Set The Value Of The Variable
bool _hasWalkedThrough = false;  // this is a private variable

// Get "_hasWalkedThrough" and make it Public you can access it outside of this class anywhere in your app
bool get hasWalkedThrough => _hasWalkedThrough;


// change _hasWalkedThrough

  changeWalkThrough(){
  // Am re-assigning the "Local" value to true
  //this would also reflect on "" hasWalkedThrough ""
  _hasWalkedThrough = true;

    //NOTE this is the equivalence of setState and should be called at the end
    //of the function to rebuild your UI
    notifyListeners();
  }

}

    2. Right at the begining I wrap the whole App With MultiProvider

void main() {
  runApp(

    MultiProvider(
      providers: [

        // The Name Of My Provider State is WalkThroughState
        ChangeNotifierProvider<WalkThroughState>(create: (context) =>  WalkThroughState()),

     // You can add any New State Class you create
    //  ChangeNotifierProvider<YourNewStateClass>(create: (context) =>  YourNewStateClass()),

    //once you add your provider here you can access it anywhere in the app

      ],
    child: MyApp()),
    );
}

    3. Use It

...

  @override
  Widget build(BuildContext context) {

    // IMPORTANT NOTE
   // You Initialize the Provider State in your "build" method
   final walkthroughState = Provider.of<WalkThroughState>(context);


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(child:
      Text(walkthroughState.hasWalkedThrough) //Produces Text("false")
      // to access any memeber in the state class just use " walkthroughState. " then you'll have access to the variables and functions in that class
      ),
    );
  }

....

Try and make the names of the classes in a file same as the file name so we cant all read well.

#Longer Variable Names are better than short ones with no meaning.
##NEVER !, I REPEAT NEVER! COMMIT TO THE MASTER BRANCH. CREATE A NEW BRANCH TO WORK FROM
