import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';

class Timetab extends StatelessWidget {
  const Timetab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManger.timeback),fit: BoxFit.fitWidth)
        )
    );
  }
}
