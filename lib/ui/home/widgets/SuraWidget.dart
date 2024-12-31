import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/assetsmanger.dart';

class Surawidget extends StatelessWidget {
  SuraModel sura;
   Surawidget({required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(alignment: Alignment.center,
          children: [
            SvgPicture.asset(AssetsManger.suranumber,height: 52,width: 52,),
            Text(sura.suraNumber.toString(),style: TextStyle(
              fontFamily: "janna",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),)
          ],
        ),
        SizedBox(width: 24,),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sura.suraNameEn,style: TextStyle(
                  fontFamily: "janna",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
              Text("${sura.versesNumber} verses",style: TextStyle(
                  fontFamily: "janna",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ))
            ],
          ),
        ),
        Text(sura.suraNameAr,style: TextStyle(
            fontFamily: "janna",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white
        ),),
      ],
    );
  }
}
