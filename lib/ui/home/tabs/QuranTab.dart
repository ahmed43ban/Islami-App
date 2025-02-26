import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/SuraModel.dart';
import 'package:islami/style/Constant.dart';
import 'package:islami/style/StringsManger.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/ui/home/widgets/ResntlySuraWidget.dart';
import 'package:islami/ui/home/widgets/SuraWidget.dart';

import '../../../style/colorsmanger.dart';
import '../../../style/prefsHelper.dart';

class Qurantab extends StatefulWidget {
  @override
  State<Qurantab> createState() => _QurantabState();
}

class _QurantabState extends State<Qurantab> {
  List<SuraModel> searchList = [];
  List<SuraModel> mostResentList = [];
  String searchValue = '';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostResentList= PrefHelper.getRecentList();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); //to click on body close keyboard
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManger.quranback),
                fit: BoxFit.fitWidth)),
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                      searchSura(value);
                    });
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      fontFamily: 'janna',
                      color: ColorManger.searchText),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    filled: true,
                    fillColor: ColorManger.secondary.withValues(alpha: 0.7),
                    hintText: "Enter Sura Name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        fontFamily: 'janna',
                        color: ColorManger.searchText),
                    prefixIconConstraints:
                    BoxConstraints(maxWidth: 56.w, maxHeight: 56.h),
                    prefixIcon: Padding(
                      padding: REdgeInsets.all(14),
                      child: SvgPicture.asset(AssetsManger.quran),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: ColorManger.primary,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorManger.primary,
                        )),
                  ),
                ),
                if (searchValue.isEmpty) ...[
                  if(mostResentList.isNotEmpty)
                    ...[
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        StringsManger.mostRecently,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            fontFamily: "janna",
                            color: ColorManger.searchText),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        flex: 1,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Resntlysurawidget(
                              recentSura: mostResentList[index],
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10.w,
                            ),
                            itemCount: mostResentList.length),
                      ),
                    ],
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(StringsManger.surasList,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          fontFamily: "janna",
                          color: ColorManger.searchText)),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
                if (searchValue.isNotEmpty)
                  ...[
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Number of results : ${searchList.length}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp,
                            fontFamily: "janna",
                            color: ColorManger.searchText)),
                    SizedBox(
                      height: 10.h,
                    )

                  ],
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) => Surawidget(
                        addToRecent: () {
                          for(int i =0 ;i<mostResentList.length;i++){
                            if(mostResentList[i].suraNameEn==(searchValue.isNotEmpty
                                ? searchList[index].suraNameEn
                                : SuraList[index].suraNameEn)){
                              mostResentList.removeAt(i);
                            }
                          }
                          if(mostResentList.length>=10){
                            mostResentList.removeLast();
                          }
                          mostResentList.insert(
                              0,
                              searchValue.isNotEmpty
                                  ? searchList[index]
                                  : SuraList[index]);
                          PrefHelper.addRecentList(mostResentList);
                          setState(() {});
                        },
                        sura: searchValue.isNotEmpty
                            ? searchList[index]
                            : SuraList[index],
                      ),
                      separatorBuilder: (context, index) => Padding(
                        padding: REdgeInsets.symmetric(horizontal: 40),
                        child: Divider(
                          height: 16.h,
                        ),
                      ),
                      itemCount: searchValue.isNotEmpty
                          ? searchList.length
                          : SuraList.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchSura(String searchText) {
    searchList = [];
    /*for (int i =0;i<SuraList.length;i++){
      if(SuraList[i].suraNameAr.contains(searchText)||SuraList[i].suraNameEn.toLowerCase().contains(searchText.toLowerCase()) ){
        searchList.add(SuraList[i]);
      }
    }*/
    searchList = SuraList.where((element) =>
    element.suraNameAr.contains(searchText) ||
        element.suraNameEn.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
