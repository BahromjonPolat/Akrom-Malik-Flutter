/*

  Created by: Bakhromjon Polat
  Created on: May 04 2023 18:08:32
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';

/// It's a class that provides a global key for the navigator
class AppNavigator {
  const AppNavigator._();

  /// Creating a global key for the navigator.
  static final _navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(String routeName, {Object? args}) async {
    return _navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? args,
  }) async {
    return _navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName) async {
    return _navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  static Future<dynamic> push(Widget page) => _navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (_) => page),
      );

  static void pop<T>([T? result]) => _navigatorKey.currentState?.pop<T>(result);
  static void checkAndPop() {
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState?.pop();
    }
  }

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
