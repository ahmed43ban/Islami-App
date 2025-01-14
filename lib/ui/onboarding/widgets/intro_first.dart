import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroFirst extends StatelessWidget {
  const IntroFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssetsManger.intro1,
            )),
        SizedBox(height: 20,),
        Text("Welcome To Islmi App",style: TextStyle(
            color: ColorManger.primary,
            fontFamily: "janna",
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),)

      ],
    );
  }
}
