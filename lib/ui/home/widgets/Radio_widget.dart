
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';

import '../../../model/Radios.dart';

class RadioWidget extends StatefulWidget {
  Radios radios;

  RadioWidget({super.key,required this.radios});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isPlay = false;

  bool isVolume=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManger.primary
      ),
      height: 133.h,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding:  REdgeInsets.symmetric(vertical: 8.0),
            child: Text(widget.radios.name!,style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                fontFamily: "janna",
                color: ColorManger.secondary),),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(isPlay?AssetsManger.soundWave:AssetsManger.mosque2,fit: BoxFit.cover,),
                Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {
                        isPlay=!isPlay;
                        setState(() {

                        });
                      }, icon: Icon(isPlay?Icons.pause:Icons.play_arrow,size: 45.sp,color: ColorManger.secondary,)),
                      IconButton(onPressed: () {
                        isVolume=!isVolume;
                        setState(() {

                        });
                      }, icon: Icon(isVolume?Icons.volume_up:Icons.volume_off_rounded,size: 45.sp,color: ColorManger.secondary,)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
