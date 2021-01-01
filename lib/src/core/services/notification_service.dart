import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatonKey => _navigationKey;

  Future<dynamic> navigateTo(Widget routeName, {dynamic arguments}) {
    return _navigationKey.currentState.push(
      MaterialPageRoute(builder: (_) => routeName)
    );
  }
}
