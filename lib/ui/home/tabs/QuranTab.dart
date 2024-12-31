import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/Constant.dart';
import 'package:islami/style/StringsManger.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/ui/home/widgets/ResntlySuraWidget.dart';
import 'package:islami/ui/home/widgets/SuraWidget.dart';

import '../../../style/colorsmanger.dart';

class Qurantab extends StatelessWidget {
  const Qurantab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus(); //to click on body close keyboard
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManger.quranback),fit: BoxFit.fitWidth)
        ),
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.center,
                    child: Image.asset(AssetsManger.logo,scale: 1.25,)),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'janna',
                    color: ColorManger.searchText
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    filled: true,
                    fillColor: ColorManger.secondary.withValues(alpha: 0.7),
                    hintText: "Enter Sura Name",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'janna',
                        color: ColorManger.searchText
                    ),
                    prefixIconConstraints:BoxConstraints(maxWidth: 56,maxHeight: 56),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(14),
                      child: SvgPicture.asset(AssetsManger.quran),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorManger.primary,)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorManger.primary,)
                    ),
                  ),

                ),
                SizedBox(height: 15,),
                Text(StringsManger.mostRecently,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: "janna",
                  color: ColorManger.searchText
                ),),
                SizedBox(height: 10,),
                Expanded(
                  flex: 1,
                  child: ListView.separated(scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>Resntlysurawidget(),
                      separatorBuilder: (context,index)=>SizedBox(width: 10,),
                      itemCount: 10),
                ),
                SizedBox(height: 10,),
                Text(StringsManger.surasList,style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "janna",
                    color: ColorManger.searchText
                )),
                SizedBox(height: 10,),
                Expanded(flex: 2,
                  child: ListView.separated(
                      itemBuilder:(context,index)=>Surawidget(sura: SuraList[index],) ,
                      separatorBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Divider(height: 16,),
                      ),
                      itemCount: SuraList.length),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
