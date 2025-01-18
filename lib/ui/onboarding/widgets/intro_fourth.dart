import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroFourth extends StatelessWidget {
  const IntroFourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManger.intro4,
                )),
            SizedBox(height: 20,),
            Text("Bearish",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 24,
                fontWeight: FontWeight.w700
            ),),
            Text("Praise the name of your Lord, the Most High",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),textAlign: TextAlign.center,),
        
          ],
        ),
      ),
    );
  }
}
