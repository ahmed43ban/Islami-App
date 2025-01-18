import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';

class SuradetailsScreen extends StatefulWidget {
  static const String routName = "Suradetails";

  @override
  State<SuradetailsScreen> createState() => _SuradetailsScreenState();
}

class _SuradetailsScreenState extends State<SuradetailsScreen> {
  String suraText ="";

  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(suraText.isEmpty){
      loadFile(sura.suraNumber);
    }
    return Scaffold(
      backgroundColor: ColorManger.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorManger.primary
        ),
        centerTitle: true,
        title: Text(sura.suraNameEn,style: TextStyle(
          color: ColorManger.primary,
          fontFamily: "janna",
            fontSize: 24,
          fontWeight: FontWeight.w700
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AssetsManger.leftcorner),
                      Expanded(
                        child: Text(textAlign: TextAlign.center,
                            sura.suraNameAr,style: TextStyle(
                                color: ColorManger.primary,
                                fontFamily: "janna",
                                fontSize: 24,
                                fontWeight: FontWeight.w700
                            )),
                      ),
                      Image.asset(AssetsManger.rightcorner),
                    ],
                  ),
                  SizedBox(height: 19,),
                  Expanded(
                    child: suraText.isEmpty
                        ?Center(child: CircularProgressIndicator(
                      color: ColorManger.primary,
                    ),)
                    :SingleChildScrollView(
                      child: Text(textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        suraText,style: TextStyle(
                          fontFamily: "janna",
                          fontWeight:FontWeight.w700 ,
                          fontSize: 20,
                          color: ColorManger.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManger.mosque,width: double.infinity)
        ],
      ),
    );
  }

  loadFile(int suraNumber)async{
    suraText=await rootBundle.loadString("assets/files/$suraNumber.txt");
    List<String> lines =suraText.split("\n");
    String temp ="";
    for(int i=0; i<lines.length;i++){
      temp+= lines[i].trim();
      temp+="(${i+1})";
    }
    suraText = temp;
    setState(() {
    });
  }
}
