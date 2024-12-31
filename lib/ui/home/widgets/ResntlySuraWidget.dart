import 'package:flutter/material.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';

class Resntlysurawidget extends StatelessWidget {
  const Resntlysurawidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManger.primary,
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 17),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Al-Anbiya",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: "janna",
                  color: ColorManger.secondary
                ),),
                Text("الأنبياء",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: "janna",
                  color: ColorManger.secondary
                ),),
                Text("112 Verses",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontFamily: "janna",
                  color: ColorManger.secondary
                ),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 7),
            child: Image.asset(AssetsManger.qurancard),
          )
        ],
      ),
    );
  }
}
