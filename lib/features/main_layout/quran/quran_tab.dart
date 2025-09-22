import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_suras.dart';
import 'package:islami_app/features/main_layout/quran/sura_item.dart';
import 'package:islami_app/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filteredSuras = SuraModel.suras;

  GlobalKey<MostRecentSurasState> mostRecentKey =
      GlobalKey<MostRecentSurasState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.quranBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(AssetsManager.islami),
            ),
            SizedBox(height: 21),
            TextField(
              onChanged: (input) {
                filterSurasListBySearchKey(input);
              },
              style: TextStyle(
                color: ColorsManager.ofWhite,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: ColorsManager.gold,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1),
                ),
                prefixIcon: ImageIcon(
                  AssetImage(AssetsManager.quranIcon),
                  color: ColorsManager.gold,
                ),
                labelText: 'Sura Name',
                labelStyle: TextStyle(
                  color: ColorsManager.ofWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            MostRecentSuras(key: mostRecentKey),
            SizedBox(height: 10),
            Text(
              'Suras List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsManager.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Divider(
                thickness: 2,
                color: ColorsManager.white,
                indent: 30,
                endIndent: 30,
              ),
              itemCount: filteredSuras.length,
              itemBuilder: (context, index) => SuraItem(
                sura: filteredSuras[index],
                mostRecentKey: mostRecentKey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterSurasListBySearchKey(String searchKey) {
    filteredSuras = SuraModel.suras
        .where(
          (sura) =>
              sura.suraNameAr.toUpperCase().contains(searchKey.toUpperCase()) ||
              sura.suraNameEn.contains(searchKey),
        )
        .toList();
    setState(() {});
  }
}