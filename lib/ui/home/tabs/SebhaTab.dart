import 'package:flutter/material.dart';
import 'package:islami/style/StringsManger.dart';
import 'package:islami/style/prefsHelper.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class Sebhatab extends StatefulWidget {
  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  int time = 0;
  int sebhaConter = 0;
  double rotation = 0.0;
  List<String> currentzekr = [
    StringsManger.firstZekr,
    StringsManger.secondtZekr,
    StringsManger.thirdZekr,
    StringsManger.FourthZekr
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = PrefHelper.getTimeZekr();
    sebhaConter = PrefHelper.getCounter();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManger.sebhaback), fit: BoxFit.fitWidth)),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManger.logo,
                    scale: 1.25,
                  )),
              SizedBox(
                height: 16,
              ),
              Text(
                StringsManger.mainzekr,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontFamily: 'janna',
                    color: ColorManger.searchText),
              ),
              SizedBox(
                height: 16,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    AssetsManger.sebhahead,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * .09),
                    child: GestureDetector(
                      onTap: () {
                        RotationAngel();
                        conter(sebhaConter);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.rotate(
                            angle: rotation,
                            child: Image.asset(
                              AssetsManger.SebhaBody,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                currentzekr[time],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                    fontFamily: 'janna',
                                    color: ColorManger.searchText),
                              ),
                              Text(
                                "${sebhaConter}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30,
                                    fontFamily: 'janna',
                                    color: ColorManger.searchText),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        time = 0;
                        sebhaConter = 0;
                        PrefHelper.saveCounter(sebhaConter);
                        PrefHelper.saveTimeZekr(time);
                      });
                    },
                    icon: Icon(
                      Icons.refresh_outlined,
                      color: ColorManger.primary,
                      size: 50,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void conter(int num) {
    setState(() {
      num++;
      sebhaConter = num;
      if (sebhaConter == 31) {
        time == 3 ? time = 0 : time++;
        sebhaConter = 0;
      }
      PrefHelper.saveCounter(sebhaConter);
      PrefHelper.saveTimeZekr(time);
    });
  }

  void RotationAngel() {
    setState(() {
      rotation == 360 ? rotation = 0 : rotation += 180;
      print(rotation);
    });
  }
}
