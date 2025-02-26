import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroLast extends StatelessWidget {
  const IntroLast({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManger.intro5,
                )),
            SizedBox(height: 20.h,),
            Text("Holy Quran Radio",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 20.h,),
            Text("You can listen to the Holy Quran Radio through the application for free and easily",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center,),
        
          ],
        ),
      ),
    );
  }
}
