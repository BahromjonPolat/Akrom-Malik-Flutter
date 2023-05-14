/*

  Created by: Bakhromjon Polat
  Created on: May 04 2023 18:10:43
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:akrom_malik_flutter/screens/home/bloc/bottom_nav_bar_bloc.dart';
import 'package:akrom_malik_flutter/screens/home/home.dart';
import 'package:akrom_malik_flutter/screens/reading/bloc/reading_bloc.dart';
import 'package:akrom_malik_flutter/screens/reading/reading_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_route_names.dart';

class RouteGenerator {
  static String? _path = '/';
  static String get path => _path ?? '/';
  const RouteGenerator._();
  static Route? onGenerateRoute(RouteSettings settings) {
    _path = settings.name;
    Object? args = settings.arguments;
    switch (settings.name) {
      case RouteNames.home:
        return _FadeRoute(
          child: BlocProvider(
            create: (context) => BottomNavBarBloc(),
            child: const HomeScreen(),
          ),
          routeName: RouteNames.home,
        );

      case RouteNames.reading:
        return _FadeRoute(
          child: BlocProvider(
            create: (context) => ReadingBloc()
              ..add(
                const ReadingEvent.started('books/warrior.html'),
              ),
            child: const ReadingBookScreen(),
          ),
          routeName: RouteNames.reading,
        );
    }
    return null;
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  _FadeRoute({
    required this.child,
    required this.routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
