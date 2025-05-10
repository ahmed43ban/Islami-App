import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:islami/model/Reciters_respose_model.dart';

import '../model/Radio_respose_model.dart';
class ApiManager {
static Future<RadioResposeModel> getRadioData()async{
 try{
  Uri uri=Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
  var response = await http.get(uri);
  var jsonRespone= jsonDecode(response.body);
  return RadioResposeModel.fromJson(jsonRespone);

  }catch (e){
  throw e.toString();
 }
}
static Future<RecitersResposeModel> getRecitersData()async{
 try{
  Uri uri=Uri.parse("https://mp3quran.net/api/v3/reciters");
  var response = await http.get(uri);
  var jsonRespone= jsonDecode(response.body);
  return RecitersResposeModel.fromJson(jsonRespone);

 }catch (e){
  throw e.toString();
 }
}
}