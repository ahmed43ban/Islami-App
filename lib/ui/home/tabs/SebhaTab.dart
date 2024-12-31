import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';

class Sebhatab extends StatelessWidget {
  const Sebhatab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManger.sebhaback),fit: BoxFit.fitWidth)
        )
    );
  }
}
