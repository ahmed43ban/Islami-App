import 'package:flutter/material.dart';
import 'package:islami/style/StringsManger.dart';

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
  //String currentZekr = StringsManger.firstZekr;
  List<String> currentzekr = [
    StringsManger.firstZekr,
    StringsManger.secondtZekr,
    StringsManger.thirdZekr,
    StringsManger.FourthZekr
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManger.sebhaback), fit: BoxFit.fitWidth)),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
              Image.asset(
                AssetsManger.sebhahead,
              ),
              GestureDetector(
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
    });
  }

  void RotationAngel() {
    setState(() {
      rotation == 360 ? rotation = 0 : rotation += 180;
      print(rotation);
    });
  }
}
