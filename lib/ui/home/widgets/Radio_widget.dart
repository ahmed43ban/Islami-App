
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/provider/radio_manger_provider.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:provider/provider.dart';

import '../../../model/Radios.dart';

class RadioWidget extends StatefulWidget {
  String name;
  String url;
  bool isRadio;
  num suraTotal;

  RadioWidget({super.key,required this.name,required this.url,this.isRadio=true,this.suraTotal=1});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isVolume=true;


  @override
  Widget build(BuildContext context) {
    return Consumer<RadioMangerProvider>(
      builder: (context, Provider, child) {
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
                child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    fontFamily: "janna",
                    color: ColorManger.secondary),),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset((Provider.isPlaying&&Provider.currentPlayingUrl==widget.url)?AssetsManger.soundWave:AssetsManger.mosque2,fit: BoxFit.cover,),
                    Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () {
                            Provider.play(widget.url);
                            setState(() {

                            });
                          }, icon: Icon((Provider.currentPlayingUrl==widget.url&&Provider.isPlaying)?Icons.pause:Icons.play_arrow,size: 45.sp,color: ColorManger.secondary,)),
                          IconButton(onPressed: () {
                            if(Provider.currentPlayingUrl==widget.url){
                              Provider.stop();
                            }
                            setState(() {

                            });
                          }, icon: Icon(Icons.stop,size: 45.sp,color: ColorManger.secondary,)),
                          IconButton(onPressed: () {
                            setState(() {
                              isVolume=!isVolume;
                              Provider.setVolume(isVolume?2.0:0);
                            });
                          }, icon: Icon(isVolume?Icons.volume_up:Icons.volume_off_rounded,size: 45.sp,color: ColorManger.secondary,)),
                          if(!widget.isRadio)
                          IconButton(onPressed: () {
                            showModalBottomSheet(context: context,
                                builder: (context) => Container(
                                  color: ColorManger.primary,
                                  alignment: Alignment.topCenter,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          AssetsManger.mosque,
                                          color: ColorManger.secondary,
                                        ),
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                AssetsManger.leftcorner,
                                                color: ColorManger.secondary,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "أختر السورة ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: "janna",
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 27.sp),
                                                ),
                                              ),
                                              Image.asset(
                                                AssetsManger.rightcorner,
                                                color: ColorManger.secondary,

                                              ),
                                            ],
                                          ),
                                          ListView.builder(itemBuilder: (context, index) => Row(
                                            children: [

                                            ],
                                          ),
                                          itemCount: widget.suraTotal.toInt(),)


                                        ],
                                      ),


                                    ],
                                  ),
                                ),);
                            setState(() {

                            });
                          }, icon: Icon(Icons.search,size: 45.sp,color: ColorManger.secondary,)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
