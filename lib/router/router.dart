import 'package:flutter/material.dart';

class Router {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  GlobalKey<NavigatorState> get navigator => _navigator;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessenger =>
      _scaffoldMessengerKey;

  void routeTo(String route) {
    _navigator.currentState?.pushNamed(route);
  }

  void routeBack() {
    _navigator.currentState?.pop();
  }

  void showErrorSnackBar(String text) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  void clearSnackBars() {
    _scaffoldMessengerKey.currentState?.clearSnackBars();
  }
}
