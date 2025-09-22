import 'package:flutter/material.dart';
import 'package:islami_app/config/prefs/prefes_manager.dart';
import 'package:islami_app/core/routes/routes_manager.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_suras.dart';
import 'package:islami_app/models/sura_details_args.dart';
import 'package:islami_app/models/sura_model.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({
    super.key,
    required this.sura,
    required this.mostRecentKey,
  });

  final SuraModel sura;
  final GlobalKey<MostRecentSurasState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PrefesManager.saveSuraIndex(sura.suraIndex);
        Navigator.pushNamed(
          context,
          RoutesManager.suraDetails,
          arguments: SuraDetailsArgs(sura: sura, mostRecentKey: mostRecentKey),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  sura.suraNameAr,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${sura.versesNum} verses',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.asset(AssetsManager.mostRecent),
          ],
        ),
      ),
    );
  }
}
