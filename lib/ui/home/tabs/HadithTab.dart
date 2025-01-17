import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/HadithModel.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:islami/ui/home/widgets/Hadithwidget.dart';
import 'package:islami/ui/home/widgets/ResntlySuraWidget.dart';

import '../../../style/assetsmanger.dart';

class Hadithtab extends StatefulWidget {
  @override
  State<Hadithtab> createState() => _HadithtabState();
}

class _HadithtabState extends State<Hadithtab> {
  List<HadithModel> HadithList = [];
  PageController controller = PageController(viewportFraction: 0.85);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadith();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetsManger.ahasethback,
            ),
            fit: BoxFit.fitWidth),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManger.logo,
                  scale: 1.25,
                )),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) => HadithList.isEmpty
                    ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManger.secondary,
                  ),
                )
                    : HadithWidget(
                  haditmodel: HadithList[index],
                ),
                itemCount: HadithList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  loadHadith() async {
    for (int i = 1; i <= 50; i++) {
      String hadith =
      await rootBundle.loadString("assets/files/Hadeeth/h${i}.txt");
      List<String> lines = hadith.split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join();
      HadithList.add(HadithModel(title: title, content: content));
    }
    setState(() {});
  }
}
