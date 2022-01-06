import 'package:flutter/material.dart';
import 'package:shared_prefs_219001867/pages/loadingScreen.dart';
import 'package:shared_prefs_219001867/pages/profile.dart';
import 'package:shared_prefs_219001867/pages/settings.dart';

class RouteManager {
  static const String loading = '/';
  static const String settigns = '/settings';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case profile:
        return MaterialPageRoute(
          builder: (context) {
            return Profile();
          },
        );

      case settigns:
        return MaterialPageRoute(
          builder: (context) {
            return Settings();
          },
        );

      case loading:
        return MaterialPageRoute(
          builder: (context) {
            return LoadingScreen(context: context);
          },
        );

      default:
        throw FormatException('Route not found!!!');
    }
  }
}
