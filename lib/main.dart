import 'package:akrom_malik_flutter/core/constants/constants.dart';
import 'package:akrom_malik_flutter/core/theme/app_theme.dart';
import 'package:akrom_malik_flutter/routing/app_navigation.dart';
import 'package:akrom_malik_flutter/routing/app_route_names.dart';
import 'package:akrom_malik_flutter/routing/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
    notificationColor: AppColors.green,
  );
  runApp(MyApp());
}

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
