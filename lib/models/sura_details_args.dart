import 'package:flutter/cupertino.dart';
import 'package:islami_app/features/main_layout/quran/most_recent_suras.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetailsArgs {

  SuraModel sura;
  GlobalKey<MostRecentSurasState> mostRecentKey;

  SuraDetailsArgs({required this.sura,required this.mostRecentKey});
}