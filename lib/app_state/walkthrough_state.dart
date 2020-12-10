import 'package:flutter/material.dart';

class WalkThroughState extends ChangeNotifier{

// Set The Value Of The Variable
  bool _hasWalkedThrough = false;  // this is a private variable

// Get "_hasWalkedThrough" and make it Public
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