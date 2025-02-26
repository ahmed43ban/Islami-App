import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/model/HadithModel.dart';
import 'package:islami/style/colorsmanger.dart';

import '../../../style/assetsmanger.dart';
import '../../hadith_details/screen/hadith_details_screen.dart';

class HadithWidget extends StatelessWidget {
  HadithModel haditmodel;
   HadithWidget({super.key,required this.haditmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(5),
      margin: REdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManger.primary,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(AssetsManger.leftcorner,color: ColorManger.secondary,),
              Expanded(
                child: Text(textAlign: TextAlign.center,
                    haditmodel.title,style: TextStyle(
                        color: ColorManger.secondary,
                        fontFamily: "janna",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700
                    )),
              ),
              Image.asset(AssetsManger.rightcorner,color: ColorManger.secondary),
            ],
          ),
          Expanded(
            child: Stack(alignment: Alignment.center,
              children: [
                Image.asset(AssetsManger.Hadithtxtback,width: 265.w,height: 411.27.h,),
                InkWell(onTap: (){
                  Navigator.pushNamed(context, HadithDetailsScreen.routName,arguments: haditmodel);
                },
                  child: Text(maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    haditmodel.content,style: TextStyle(
                      fontFamily: "janna",
                      fontWeight:FontWeight.w700 ,
                      fontSize: 16.sp,
                      color: ColorManger.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AssetsManger.mosque,width: double.infinity,color: ColorManger.secondary,)
        ],
      ),
    );
  }
}
