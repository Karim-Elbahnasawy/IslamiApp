import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<bool> saveOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingVisited', true);
    return true;
  }

  static Future<bool> getOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onBoardingVisited') ?? false;
  }
}
