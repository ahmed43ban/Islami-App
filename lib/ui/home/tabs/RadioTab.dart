import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';
import '../widgets/Radio_widget.dart';

class Radiotab extends StatelessWidget {
  const Radiotab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManger.radioback),fit: BoxFit.fitWidth)
        ),
      child: DefaultTabController(
        initialIndex: 0,
          length: 2,
          child: SafeArea(
            child: Padding(
              padding:  REdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetsManger.logo,
                        width: 299.w,
                        height: 141.h,
                      )),
                  SizedBox(
                    height: 21.h,
                  ),
                  Container(
                    padding: REdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xb3202020)
                    ),
                    child: TabBar(
                      unselectedLabelStyle:TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          fontFamily: "janna",
                        color: ColorManger.teritary
                          ) ,
                    
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          fontFamily: "janna",
                          color: ColorManger.secondary
                        ),
                        dividerHeight: 0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator:BoxDecoration(
                          color: ColorManger.primary,
                          borderRadius: BorderRadius.circular(12.r)
                        ),
                        tabs: [
                      Tab(text: "Radio",),
                      Tab(text: "Reciters",),
                    ]),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                               ListView.separated(
                                   itemBuilder: (context, index) => RadioWidget(),
                                   separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                                   itemCount: 20),
                               ListView.separated(
                                   itemBuilder: (context, index) => RadioWidget(),
                                   separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                                   itemCount: 20),
                    ]),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
