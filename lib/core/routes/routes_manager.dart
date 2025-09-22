import 'package:flutter/material.dart';
import 'package:islami_app/features/main_layout/main_layout_screen.dart';
import 'package:islami_app/features/onboarding/intro_screen.dart';
import 'package:islami_app/features/splash/splash_screen.dart';
import 'package:islami_app/features/sura_details/sura_details_screen.dart';

abstract class RoutesManager {
  static const String splash = '/SplashScreen';
  static const String mainLayout = '/MainLayoutScreen';
  static const String suraDetails = '/SuraDetailsScreen';
  static const String intro = '/IntroScreen';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    mainLayout: (context) => MainLayoutScreen(),
    suraDetails: (context) => SuraDetailsScreen(),
    intro: (context) => IntroScreen(),
  };
}
