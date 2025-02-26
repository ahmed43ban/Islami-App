import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/style/prefsHelper.dart';
import 'package:islami/ui/onboarding/screen/onboarding_screen.dart';

import '../../../style/assetsmanger.dart';
import '../../home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      bool onboarding = PrefHelper.getBool();
      onboarding==true
          ?Navigator.pushReplacementNamed(context, HomeScreen.routeName)
          : Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        height: 932.h,
        AssetsManger.splash,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
