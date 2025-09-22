import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/features/main_layout/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.hadithBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AssetsManager.islamiHadith),
          SizedBox(height: 30),
          CarouselSlider(
            items: List.generate(
              50,
              (index) => index + 1,
            ).map((index) => HadithItem(index: index)).toList(),
            options: CarouselOptions(
              height: 580,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
