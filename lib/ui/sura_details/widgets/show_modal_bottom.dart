import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/prefsHelper.dart';

import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';

class ShowModalBottom extends StatefulWidget {
  String nameAr;
  String numAya;
  SuraModel suraModel;
  String chosen;
  ShowModalBottom({this.chosen='',required this.numAya,required this.nameAr,required this.suraModel});

  @override
  State<ShowModalBottom> createState() => _ShowModalBottomState();
}

class _ShowModalBottomState extends State<ShowModalBottom> {
  String? selectedVerse;

  @override
  void initState() {
    super.initState();
    selectedVerse = widget.chosen.isNotEmpty ? widget.chosen : null;
  }
  @override
  Widget build(BuildContext context) {
    List<String> verseNumbers = List.generate(
        int.parse(widget.suraModel.versesNumber),
            (index) => (index + 1).toString()
    );
    return Container(
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
                      "أحفظ الاية ",
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
              Column(
                children: [
                  Text("أخر أية تم حفظها من سورة ${widget.nameAr} أية رقم ${widget.numAya}",
                    style: TextStyle(
                      fontFamily: "janna",
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),),
                  SizedBox(height: 30.h,),
                  Text("حفظ آية جديدة من سورة ${widget.suraModel.suraNameAr}",style: TextStyle(
                    fontFamily: "janna",
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),),
                  SizedBox(height: 20.h,),
                  DropdownButton<String>(
                    hint: Text("أختار رقم الآية"),
                    dropdownColor: ColorManger.primary,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManger.secondary
                    ),
                    padding: REdgeInsets.all(8),
                    iconEnabledColor: ColorManger.dotSecondary,
                    iconDisabledColor: ColorManger.dotSecondary,
                    value: selectedVerse,
                    onChanged: (newValue) {
                      setState(() {
                        selectedVerse = newValue;
                        widget.chosen = newValue!;  // Update the chosen verse
                      });
                    },
                    items: verseNumbers.map((verse) {
                      return DropdownMenuItem<String>(
                        value: verse,
                        child: Text('آية رقم $verse'),
                      );
                    }).toList(),
                  ),                ],
              ),
              SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          PrefHelper.addStopName(widget.suraModel.suraNameAr);
                          PrefHelper.addStop(widget.chosen);
                          showToast("تم حفظ الأية");
                          Navigator.pop(context);
                        });
                      },
                      iconSize: 40.sp,
                      icon:  Row(
                        children: [
                          Text("حفظ",
                            style: TextStyle(
                                fontFamily: "janna",
                                fontWeight: FontWeight.w700,
                                fontSize: 30.sp,
                            ),),
                          Icon(
                            Icons.check,
                            color: ColorManger.secondary,
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ],
          ),


        ],
      ),
    );
  }
  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManger.dotSecondary,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}


