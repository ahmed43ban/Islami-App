import 'package:flutter/material.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';
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
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManger.logo,
                  )),
              Expanded(
                child: Column(
                  children:[
                    intros[index]
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    if(index>0)
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          index = index-1;
                        });
                      },
                      child: Text("Back",style: TextStyle(
                        color: ColorManger.primary,
                          fontFamily: "janna",
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),),
                    ),
                    Expanded(child: Icon(Icons.skip_next_outlined)),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          index<4 ? index= index+1
                              :Navigator.pushReplacementNamed(context, HomeScreen.routeName);

                        });
                      },
                      child: index <4 ?Text("Next",style: TextStyle(
                          color: ColorManger.primary,
                          fontFamily: "janna",
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),):Text("Finish",style: TextStyle(
                          color: ColorManger.primary,
                          fontFamily: "janna",
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),)
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
}
