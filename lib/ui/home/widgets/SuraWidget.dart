import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/ui/sura_details/screen/suradetails_screen.dart';

class Surawidget extends StatelessWidget {
  SuraModel sura;
  final void Function() addToRecent;
  Surawidget({required this.sura, required this.addToRecent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addToRecent();
        Navigator.pushNamed(context, SuradetailsScreen.routName,
            arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AssetsManger.suranumber,
                height: 52.h,
                width: 52.w,
              ),
              Text(
                sura.suraNumber.toString(),
                style: TextStyle(
                    fontFamily: "janna",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )
            ],
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                      fontFamily: "janna",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text("${sura.versesNumber} verses",
                    style: TextStyle(
                        fontFamily: "janna",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white))
              ],
            ),
          ),
          Text(
            sura.suraNameAr,
            style: TextStyle(
                fontFamily: "janna",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
