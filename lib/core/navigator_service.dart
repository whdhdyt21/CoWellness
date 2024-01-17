import 'package:flutter/material.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate,
        arguments: arguments);
  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  static Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed<T>(routeName, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T>(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed<T, Object>(routeName, arguments: arguments);
  }
}
