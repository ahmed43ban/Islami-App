import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/HadithModel.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String routName = "HadithScreen";

  @override
  State<HadithDetailsScreen> createState() => _SuradetailsScreenState();
}

class _SuradetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HadithModel hadith =
    ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: ColorManger.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorManger.primary),
        centerTitle: true,
        title: Text(
          hadith.title,
          style: TextStyle(
              color: ColorManger.primary,
              fontFamily: "janna",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AssetsManger.leftcorner),
                      Expanded(
                        child: Text(
                            textAlign: TextAlign.center,
                            hadith.title,
                            style: TextStyle(
                                color: ColorManger.primary,
                                fontFamily: "janna",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                      Image.asset(AssetsManger.rightcorner),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        hadith.content,
                        style: TextStyle(
                          fontFamily: "janna",
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: ColorManger.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManger.mosque, width: double.infinity)
        ],
      ),
    );
  }
}
