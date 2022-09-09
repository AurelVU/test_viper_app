import 'package:flutter/widgets.dart';

class Router {
  static late GlobalKey<NavigatorState> _navigator;
  static init(GlobalKey<NavigatorState> navigator) {
    _navigator = navigator;
  }

  void routeTo(String route) {
    _navigator.currentState?.pushNamed(route);
  }

  void routeBack() {
    _navigator.currentState?.pop();
  }
}