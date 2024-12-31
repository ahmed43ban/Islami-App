import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';

class Hadithtab extends StatelessWidget {
  const Hadithtab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       child:  Image.asset(AssetsManger.ahasethback,fit: BoxFit.fitWidth)
    );
  }
}
