import 'package:flutter/material.dart';
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
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManger.primary,
          borderRadius: BorderRadius.circular(20)
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
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    )),
              ),
              Image.asset(AssetsManger.rightcorner,color: ColorManger.secondary),
            ],
          ),
          Expanded(
            child: Stack(alignment: Alignment.center,
              children: [
                Image.asset(AssetsManger.Hadithtxtback,scale: 1.25,),
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
                      fontSize: 16,
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
