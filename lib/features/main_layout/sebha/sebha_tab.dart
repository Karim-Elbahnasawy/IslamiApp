import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> tasbeh = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int counter = 0;
  int index = 0;
  double rotateAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Image.asset(AssetsManager.sebhaIslami, width: 291, height: 171),
              SizedBox(height: 16),
              Text(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                style: TextStyle(
                  color: ColorsManager.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      checkTasbeh();
                      setState(() {
                        rotateAngle += 0.02;
                      });
                    },
                    child: Transform.rotate(
                      angle: rotateAngle,
                      alignment: Alignment.center,
                      child: Image.asset(AssetsManager.sebhaImage),
                    ),
                  ),
                  Column(
                    spacing: 16,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        tasbeh[index],
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '$counter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkTasbeh() {
    counter++;
    if (counter == 34) {
      counter = 0;
      index++;
      if (index >= tasbeh.length) {
        index = 0;
      }
    }
  }
}
