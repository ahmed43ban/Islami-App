import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/api/api_manager.dart';
import 'package:islami/model/Radio_respose_model.dart';
import 'package:islami/model/Radios.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';
import '../widgets/Radio_widget.dart';

class Radiotab extends StatefulWidget {
  const Radiotab({super.key});

  @override
  State<Radiotab> createState() => _RadiotabState();
}

class _RadiotabState extends State<Radiotab> {
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
                               FutureBuilder<RadioResposeModel>(future: ApiManager.getRadioData(),
                                   builder: (context, snapshot) {
                                     if(snapshot.connectionState==ConnectionState.waiting){
                                       return Center(child: CircularProgressIndicator(color: ColorManger.primary,));
                                     }else if(snapshot.hasError){
                                       return Column(
                                         children: [
                                           Text("Some thing went wrong",style: TextStyle(
                                               color: ColorManger.teritary,
                                               fontFamily: "janna",
                                               fontSize: 20.sp,
                                               fontWeight: FontWeight.w700
                                           ),),
                                           SizedBox(height: 20.h,),
                                           ElevatedButton(onPressed: () {
                                             setState(() {

                                             });
                                           }, child: Text("Try again",style: TextStyle(
                                               color: ColorManger.primary,
                                               fontFamily: "janna",
                                               fontSize: 20.sp,
                                               fontWeight: FontWeight.w700
                                           )))
                                         ],
                                       );
                                     }
                                     RadioResposeModel data =snapshot.data!;
                                     return ListView.separated(
                                         itemBuilder: (context, index) => RadioWidget(radios:data.radios![index]),
                                         separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                                         itemCount: data.radios!.length);
                                   },),
                               ListView.separated(
                                   itemBuilder: (context, index) => Container(),
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
