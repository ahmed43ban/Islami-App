import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/style/StringsManger.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:islami/ui/home/tabs/HadithTab.dart';
import 'package:islami/ui/home/tabs/QuranTab.dart';
import 'package:islami/ui/home/tabs/RadioTab.dart';
import 'package:islami/ui/home/tabs/SebhaTab.dart';
import 'package:islami/ui/home/tabs/TimeTab.dart';
import '../../../style/assetsmanger.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selctedindex = 0;
  List<Widget> tabs = [
    Qurantab(),
    Hadithtab(),
    Sebhatab(),
    Radiotab(),
    Timetab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
          height: 80.h,
          onDestinationSelected: (index) {
            setState(() {
              selctedindex = index;
            });
          },
          selectedIndex: selctedindex,
          backgroundColor: ColorManger.primary,
          indicatorColor: ColorManger.Naveitemback,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsManger.quran,
                  colorFilter:
                  ColorFilter.mode(ColorManger.secondary, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  AssetsManger.quran,
                  colorFilter:
                  ColorFilter.mode(ColorManger.teritary, BlendMode.srcIn),
                ),
                label: StringsManger.quran),
            NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsManger.ahadeth,
                  colorFilter:
                  ColorFilter.mode(ColorManger.secondary, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  AssetsManger.ahadeth,
                  colorFilter:
                  ColorFilter.mode(ColorManger.teritary, BlendMode.srcIn),
                ),
                label: StringsManger.hadith),
            NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsManger.sebha,
                  colorFilter:
                  ColorFilter.mode(ColorManger.secondary, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  AssetsManger.sebha,
                  colorFilter:
                  ColorFilter.mode(ColorManger.teritary, BlendMode.srcIn),
                ),
                label: StringsManger.sebha),
            NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsManger.radio,
                  colorFilter:
                  ColorFilter.mode(ColorManger.secondary, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  AssetsManger.radio,
                  colorFilter:
                  ColorFilter.mode(ColorManger.teritary, BlendMode.srcIn),
                ),
                label: StringsManger.radio),
            NavigationDestination(
                icon: SvgPicture.asset(
                  AssetsManger.time,
                  colorFilter:
                  ColorFilter.mode(ColorManger.secondary, BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  AssetsManger.time,
                  colorFilter:
                  ColorFilter.mode(ColorManger.teritary, BlendMode.srcIn),
                ),
                label: StringsManger.time),
          ]),
      body: tabs[selctedindex],
    );
  }
}
