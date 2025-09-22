import 'package:flutter/material.dart';
import 'package:islami_app/config/prefs/prefes_manager.dart';
import 'package:islami_app/core/extensions/context_extention.dart';
import 'package:islami_app/core/utils/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_item.dart';
import 'package:islami_app/models/sura_model.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => MostRecentSurasState();
}

class MostRecentSurasState extends State<MostRecentSuras> {
  List<SuraModel> mostRecentSuras = [];

  @override
  void initState() {
    fetchMostRecent();
    super.initState();
  }

  void fetchMostRecent() async {
    mostRecentSuras = await PrefesManager.getMostRecentSuras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsManager.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: context.getHeight * 0.17,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: mostRecentSuras.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => MostRecentItem(
                sura: mostRecentSuras[index],
                mostRecentKey: widget.key as GlobalKey<MostRecentSurasState>,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
