import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/assets_manager.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  const HadithItem({super.key, required this.index});

  final int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadithModel;

  @override
  void initState() {
    loadHadithContent(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(AssetsManager.hadithBack),
          colorFilter: ColorFilter.mode(
            ColorsManager.black.withOpacity(0.3),
            BlendMode.srcIn,
          ),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsManager.suraDetailsLeftCorner,
                    color: ColorsManager.black,
                    width: 100,
                    height: 93,
                  ),
                  Image.asset(
                    AssetsManager.suraDetailsRightCorner,
                    color: ColorsManager.black,
                    width: 100,
                    height: 93,
                  ),
                ],
              ),
              Text(
                hadithModel?.title ?? '',
                style: TextStyle(
                  color: ColorsManager.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: hadithModel == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.black,
                    ),
                  )
                : SingleChildScrollView(
                    child: Text(
                      hadithModel!.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: ColorsManager.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          Image.asset(AssetsManager.hadithBackgroundButton),
        ],
      ),
    );
  }

  Future<void> loadHadithContent(int index) async {
    String filePath = 'assets/files/hadith/h$index.txt';
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = fileContent.trim().split('\n');
    String hadithTitle = hadithLines[0];
    hadithLines.removeAt(0);
    String hadithContent = hadithLines.join();
    await Future.delayed(Duration(seconds: 1));
    hadithModel = HadithModel(title: hadithTitle, content: hadithContent);
    if(mounted){
    setState(() {});

    }
  }
}
