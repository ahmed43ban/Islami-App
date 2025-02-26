import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroThird extends StatelessWidget {
  const IntroThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManger.intro3,
                )),
            SizedBox(height: 20.h,),
            Text("Reading the Quran",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 20.h,),
            Text("Read, and your Lord is the Most Generous",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center,),
        
          ],
        ),
      ),
    );
  }
}
