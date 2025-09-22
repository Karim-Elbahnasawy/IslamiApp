import 'package:flutter/material.dart';
import 'package:islami_app/config/prefs/prefes_manager.dart';
import 'package:islami_app/core/routes/routes_manager.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_suras.dart';
import 'package:islami_app/models/sura_details_args.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.sura, required this.mostRecentKey});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AssetsManager.suraNumber, width: 52, height: 52),
                Text(
                  sura.suraIndex,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24),
            Column(
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
                Text(
                  sura.versesNum,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              sura.suraNameAr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
