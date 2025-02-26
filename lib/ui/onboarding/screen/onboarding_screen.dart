import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:islami/style/prefsHelper.dart';
import 'package:islami/ui/home/screen/home_screen.dart';
import 'package:islami/ui/onboarding/widgets/intro_first.dart';
import 'package:islami/ui/onboarding/widgets/intro_fourth.dart';
import 'package:islami/ui/onboarding/widgets/intro_last.dart';
import 'package:islami/ui/onboarding/widgets/intro_seconed.dart';
import 'package:islami/ui/onboarding/widgets/intro_third.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName="onBoarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index=0;
  int curnnetphoto=0;

  List<Widget>intros =[
    IntroFirst(),
    IntroSeconed(),
    IntroThird(),
    IntroFourth(),
    IntroLast()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.secondary,
      body: SafeArea(
        child: RPadding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManger.logo,
                  )),
              Expanded(
                child: GestureDetector(
                  onHorizontalDragEnd:onSwipe ,
                  child: Column(
                    children:[
                      intros[index]
                    ]
                  ),
                ),
              ),
              RPadding(
                padding: REdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(index>0)
                          index = index-1;
                          curnnetphoto = index;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        margin: REdgeInsets.all(5),
                        child: index>0?Text("Back",style: TextStyle(
                            color: ColorManger.primary,
                            fontFamily: "janna",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700
                        ),)
                            :SizedBox(width: 30.w,),
                      )
                    ),
                    Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index){
                        return  Column(
                          children: [
                            AnimatedContainer(duration: Duration(milliseconds: 300),
                              height: 8.h,
                              width: curnnetphoto==index?25.w:10.w,
                              decoration: BoxDecoration(
                                  color: curnnetphoto==index?ColorManger.dotPrimary:ColorManger.dotSecondary,
                                  borderRadius: BorderRadius.circular(5.r)
                              ),),
                            if (index < 4) SizedBox(width: 20.w),
                          ],
                        );
                      }),
                    ),),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          index<4 ? index= index+1
                              :Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          curnnetphoto = index;

                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        margin: REdgeInsets.all(5),
                        child: index <4 ?Text("Next",style: TextStyle(
                            color: ColorManger.primary,
                            fontFamily: "janna",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700
                        ),):Text("Finish",style: TextStyle(
                            color: ColorManger.primary,
                            fontFamily: "janna",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700
                        ),),
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void onSwipe(DragEndDetails details){
    if (details.primaryVelocity! < 0) {
      if (index < 4) {
        setState(() {
          index++;
          curnnetphoto = index;
        });
      }else if (index == 4){
        PrefHelper.saveBool(true);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    } else if (details.primaryVelocity! > 0) {
      if (index > 0) {
        setState(() {
          index--;
          curnnetphoto = index;
        });
      }
    }
  }

    }
