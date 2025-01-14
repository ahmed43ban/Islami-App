import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroThird extends StatelessWidget {
  const IntroThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssetsManger.intro3,
            )),
        SizedBox(height: 20,),
        Text("Reading the Quran",style: TextStyle(
            color: ColorManger.primary,
            fontFamily: "janna",
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 20,),
        Text("Read, and your Lord is the Most Generous",style: TextStyle(
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
