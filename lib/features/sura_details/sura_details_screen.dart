import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/models/sura_details_args.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraDetailsArgs suraDetailsArguments;

  @override
  void didChangeDependencies() {
    suraDetailsArguments =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    loadSuraContent(suraDetailsArguments.sura.suraIndex);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    suraDetailsArguments.mostRecentKey.currentState?.fetchMostRecent();
    super.dispose();
  }

  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(suraDetailsArguments.sura.suraNameEn)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 25),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsManager.suraDetailsLeftCorner,
                      width: 95,
                      height: 95,
                    ),
                    Image.asset(
                      AssetsManager.suraDetailsRightCorner,
                      width: 95,
                      height: 95,
                    ),
                  ],
                ),
                Text(
                  suraDetailsArguments.sura.suraNameAr,
                  style: TextStyle(
                    color: ColorsManager.gold,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: suraContent.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.gold,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Text(
                        suraContent,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: ColorsManager.gold,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    String filePath = 'assets/files/suras/$suraIndex.txt';
    String fileContent = await rootBundle.loadString(filePath);
    List<String> suraLines = fileContent.trim().split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    await Future.delayed(Duration(seconds: 1));
    suraContent = suraLines.join();
    setState(() {});
  }
}
