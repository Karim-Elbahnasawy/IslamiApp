import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/features/main_layout/hadith/hadith_tab.dart';
import 'package:islami_app/features/main_layout/quran/quran_tab.dart';
import 'package:islami_app/features/main_layout/radio/radio_tab.dart';
import 'package:islami_app/features/main_layout/sebha/sebha_tab.dart';
import 'package:islami_app/features/main_layout/time/time_tab.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int selcetedIndex = 0;

  final List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: tabs[selcetedIndex],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selcetedIndex,

      onTap: (index) {
        setState(() {
          selcetedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: AssetsManager.quran,
            isSelected: selcetedIndex == 0,
          ),
          label: 'Quran',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: AssetsManager.hadith,
            isSelected: selcetedIndex == 1,
          ),
          label: 'Hadith',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: AssetsManager.sebha,
            isSelected: selcetedIndex == 2,
          ),
          label: 'Sebha',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: AssetsManager.radio,
            isSelected: selcetedIndex == 3,
          ),
          label: 'Radio',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(
            icon: AssetsManager.time,
            isSelected: selcetedIndex == 4,
          ),
          label: 'Time',
        ),
      ],
    );
  }

  Widget _buildIcon({required String icon, required bool isSelected}) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorsManager.black.withOpacity(0.6),
            ),
            child: SvgPicture.asset(icon, color: Colors.white),
          )
        : SvgPicture.asset(icon, color: Colors.black);
  }
}
