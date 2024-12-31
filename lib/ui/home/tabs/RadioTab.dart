import 'package:flutter/material.dart';

import '../../../style/assetsmanger.dart';

class Radiotab extends StatelessWidget {
  const Radiotab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManger.radioback),fit: BoxFit.fitWidth)
        )
    );
  }
}
