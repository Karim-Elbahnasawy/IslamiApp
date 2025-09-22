import 'package:flutter/material.dart';
import 'package:islami_app/config/prefs/cache_helper.dart';
import 'package:islami_app/core/routes/routes_manager.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/models/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  bool isFisrtPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            isLastPage = (index == 4);
            isFisrtPage = (index == 0);
          });
        },
        controller: _pageController,
        itemCount: OnBoardingModel.images.length,
        itemBuilder: (context, index) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Image.asset(
                    AssetsManager.introIslami,
                    width: 270,
                    height: 170,
                  ),
                  SizedBox(height: 30),
                  Image.asset(OnBoardingModel.images[index]),
                  SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    OnBoardingModel.titles[index],
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    OnBoardingModel.descriptions[index],
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isFisrtPage
                            ? TextButton(onPressed: () {}, child: Text(''))
                            : TextButton(
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.gold,
                                  ),
                                ),
                              ),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: OnBoardingModel.images.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: ColorsManager.gold,
                            dotColor: Colors.grey,
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 8,
                          ),
                        ),
                        isLastPage
                            ? TextButton(
                                onPressed: () {
                                  CacheHelper.saveOnBoarding();
                                  Navigator.pushReplacementNamed(
                                    context,
                                    RoutesManager.mainLayout,
                                  );
                                },
                                child: Text(
                                  'Finish',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.gold,
                                  ),
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  CacheHelper.saveOnBoarding();
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.gold,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
