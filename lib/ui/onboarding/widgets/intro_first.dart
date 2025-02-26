import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class IntroFirst extends StatelessWidget {
  const IntroFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManger.intro1,
                )),
            SizedBox(height: 20.h,),
            Text("Welcome To Islmi App",style: TextStyle(
                color: ColorManger.primary,
                fontFamily: "janna",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700
            ),)
        
          ],
        ),
      ),
    );
  }
}
