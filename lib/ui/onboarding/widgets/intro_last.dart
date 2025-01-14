import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroLast extends StatelessWidget {
  const IntroLast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssetsManger.intro5,
            )),
        SizedBox(height: 15,),
        Text("Holy Quran Radio",style: TextStyle(
            color: ColorManger.primary,
            fontFamily: "janna",
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 15,),
        Text("You can listen to the Holy Quran Radio through the application for free and easily",style: TextStyle(
            color: ColorManger.primary,
            fontFamily: "janna",
            fontSize: 20,
            fontWeight: FontWeight.w700
        ),
        textAlign: TextAlign.center,),

      ],
    );
  }
}
