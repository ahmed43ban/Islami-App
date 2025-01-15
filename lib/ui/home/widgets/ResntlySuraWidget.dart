import 'package:flutter/material.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:islami/ui/sura_details/screen/suradetails_screen.dart';

class Resntlysurawidget extends StatelessWidget {
  SuraModel recentSura;
  Resntlysurawidget({required this.recentSura});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SuradetailsScreen.routName,arguments: recentSura);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManger.primary,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    recentSura.suraNameEn,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: "janna",
                        color: ColorManger.secondary),
                  ),
                  Text(
                    recentSura.suraNameAr,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: "janna",
                        color: ColorManger.secondary),
                  ),
                  Text(
                    "${recentSura.versesNumber} Verses",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: "janna",
                        color: ColorManger.secondary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Image.asset(AssetsManger.qurancard),
            )
          ],
        ),
      ),
    );
  }
}
