import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroSeconed extends StatelessWidget {
  const IntroSeconed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              AssetsManger.intro2,
            )),
        SizedBox(height: 20,),
        Text("Welcome To Islmi App",style: TextStyle(
            color: ColorManger.primary,
            fontFamily: "janna",
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),),
        SizedBox(height: 20,),
        Text("We Are Very Excited To Have You In Our Community",style: TextStyle(
            color: ColorManger.primary,
            fontFamily: "janna",
            fontSize: 20,
            fontWeight: FontWeight.w700
        ),textAlign: TextAlign.center,),

      ],
    );
  }
}
