import 'package:flutter/material.dart';
import 'package:islami_app/config/theme/theme_manager.dart';
import 'package:islami_app/core/routes/routes_manager.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.theme,
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.splash,
    );
  }
}
