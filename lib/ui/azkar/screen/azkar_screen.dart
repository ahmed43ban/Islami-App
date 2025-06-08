import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/HadithModel.dart';
import '../../../style/assetsmanger.dart';
import '../../../style/colorsmanger.dart';
import '../../home/widgets/Hadithwidget.dart';

class AzkarScreen extends StatefulWidget {
  static const String routeName = "Azkar";
  AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<HadithModel> ZekrList = [];
  PageController controller = PageController(viewportFraction: 0.85);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadZekr();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetsManger.ahasethback,
            ),
            fit: BoxFit.fitWidth),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor:  Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorManger.primary),
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManger.logo,
                    width: 289.w,
                    height: 129.h,
                  )),
              SizedBox(
                height: 32.h,
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (context, index) => ZekrList.isEmpty
                      ? Center(
                    child: CircularProgressIndicator(
                      color: ColorManger.secondary,
                    ),
                  )
                      : HadithWidget(
                    haditmodel: ZekrList[index],
                  ),
                  itemCount: ZekrList.length,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
  loadZekr() async {
    for (int i = 1; i <3; i++) {
      String zekr =
      await rootBundle.loadString("assets/files/Azkar/${i}.txt");
      List<String> lines = zekr.split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join("\n");
      ZekrList.add(HadithModel(title: title, content: content));
    }
    setState(() {});
  }
}

