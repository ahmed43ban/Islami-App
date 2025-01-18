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
  int chosenCounter =31;
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
    chosenCounter=PrefHelper.getchosen();
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: chosenCounter==11?ColorManger.primary:ColorManger.secondary
                              ),
                              onPressed:(){
                                setState(() {
                                  chosenCounter=11;
                                  sebhaConter=0;
                                  time=0;
                                });
                                PrefHelper.savechossen(chosenCounter);
                              },
                              child: Text("10",style:TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: chosenCounter==11?20:10,
                                  fontFamily: 'janna',
                                  color: ColorManger.searchText) ,)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: chosenCounter==31?ColorManger.primary:ColorManger.secondary
                              ),
                              onPressed:(){
                                setState(() {
                                  chosenCounter=31;
                                  sebhaConter=0;
                                  time=0;
                                });
                                PrefHelper.savechossen(chosenCounter);
                              },
                              child: Text("30",style:TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: chosenCounter==31?20:10,
                                  fontFamily: 'janna',
                                  color: ColorManger.searchText) ,)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: chosenCounter==101?ColorManger.primary:ColorManger.secondary
                              ),
                              onPressed:(){
                                setState(() {
                                  chosenCounter=101;
                                  sebhaConter=0;
                                  time=0;
                                });
                                PrefHelper.savechossen(chosenCounter);
                              },
                              child: Text("100",style:TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: chosenCounter==101?20:10,
                                  fontFamily: 'janna',
                                  color: ColorManger.searchText) ,)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  time = 0;
                                  sebhaConter = 0;
                                  chosenCounter=31;
                                  PrefHelper.saveCounter(sebhaConter);
                                  PrefHelper.saveTimeZekr(time);
                                  PrefHelper.savechossen(chosenCounter);
                                });
                              },
                              icon: Icon(
                                Icons.refresh_outlined,
                                color: ColorManger.primary,
                                size: 50,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
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
      if (sebhaConter == chosenCounter) {
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
