import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/config/prefs/cache_helper.dart';
import 'package:islami_app/core/routes/routes_manager.dart';
import 'package:islami_app/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() {
    Future.delayed(Duration(seconds: 2), () {
      checkIsOnboardingVisited();
    });
  }

  Future<void> checkIsOnboardingVisited() async {
    bool isVisited = await CacheHelper.getOnBoarding();
    if (isVisited) {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.intro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 7),
            SvgPicture.asset(AssetsManager.logo),
            Spacer(flex: 3),
            Image.asset(AssetsManager.organization),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
