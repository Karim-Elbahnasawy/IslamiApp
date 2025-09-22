import 'package:islami_app/core/utils/assets_manager.dart';

abstract class OnBoardingModel {
  static List<String> images = [
    AssetsManager.welceome,
    AssetsManager.community,
    AssetsManager.reading,
    AssetsManager.tasbeh,
    AssetsManager.radioIntro,
  ];
  static List<String> titles = [
    '',
    'Welcome To Islami',
    'Reading the Quran',
    'Bearish',
    'Holy Quran Radio',
  ];
  static List<String> descriptions = [
    'Welcome To Islmi App',
    'We Are Very Excited To Have You In Our Community',
    'Read, and your Lord is the Most Generous',
    'Praise the name of your Lord, the Most High',
    'You can listen to the Holy Quran Radio through the application for free and easily',
  ];
}
