import 'package:akrom_malik_flutter/core/theme/app_theme.dart';
import 'package:akrom_malik_flutter/routing/app_navigation.dart';
import 'package:akrom_malik_flutter/routing/app_route_names.dart';
import 'package:akrom_malik_flutter/routing/route_generator.dart';
import 'package:akrom_malik_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/bloc/bottom_nav_bar_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      navigatorKey: AppNavigator.navigatorKey,
      initialRoute: RouteNames.home,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
