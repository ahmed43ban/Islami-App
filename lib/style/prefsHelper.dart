import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  // Obtain shared preferences.
 static late SharedPreferences prefs;
 static init() async {
  prefs = await SharedPreferences.getInstance();
}
/*// Save an integer value to 'counter' key.
  await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
  await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
  await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
  await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
  await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);*/
  static savechossen(int chosenCounter){
    prefs.setInt("chosen", chosenCounter);
  }
  static int getchosen(){
    int chosenCounter = prefs.getInt("chosen")??31;
    return chosenCounter;
  }
  static saveCounter(int sebhaConter){
    prefs.setInt("sebhanum", sebhaConter);
  }
  static int getCounter(){
    int count = prefs.getInt("sebhanum") ?? 0;
    return count;
  }
  static saveTimeZekr(int time){
    prefs.setInt("time", time);
  }
  static int getTimeZekr(){
    int time = prefs.getInt("time") ??0;
    return time;
  }
  static addRecentList(List<SuraModel>mostRcentList){
    List<String> MostStringList= mostRcentList.map((Sura)=>Sura.suraNameEn).toList();
    prefs.setStringList("mostRecent", MostStringList);
  }
  static List<SuraModel> getRecentList(){
    List<String> MostStringList= prefs.getStringList("mostRecent")?? [];
    List<SuraModel>Mostrecent=[];
    for(String suraName in MostStringList){
      SuraModel SuraFound= SuraList.firstWhere((sura)=>sura.suraNameEn==suraName);
      Mostrecent.add(SuraFound);
    }
    return Mostrecent;
  }
  static saveBool(bool onboard){
    prefs.setBool('done', onboard);
  }
  static getBool(){
    return prefs.get("done")??false;
  }
  static addStop(String num){
    prefs.setString("aya", num);
  }
  static getStop(){
    return prefs.getString("aya")??'';
  }
  static addStopName(String num){
    prefs.setString("sura", num);
  }
  static getStopName(){
    return prefs.getString("sura")??'';
  }
}