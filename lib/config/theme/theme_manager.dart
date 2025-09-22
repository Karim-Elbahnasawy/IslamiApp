import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/colors_manager.dart';

abstract class ThemeManager {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.gold,
      ),
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.gold,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      backgroundColor: ColorsManager.gold,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
    ),
  );
}
