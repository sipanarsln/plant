// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../constants/constants_color.dart';
import '../../../models/flower.dart';

class IsikCart extends StatelessWidget {
  final Flower flower;
  const IsikCart({
    super.key,
    required this.flower,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: ColorItems().darkGrey),
          color: ColorItems().white),
      child: Padding(
        padding: context.paddingLow * 1.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/sun.png",
              width: 35,
              color: Colors.yellow[800],
            ),
            const SizedBox(height: 10),
            Text(
              "Işık",
              style: TextStyle(
                  fontFamily: "SansSerifLight",
                  fontSize: 17,
                  color: ColorItems().darkGrey,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              flower.light,
              style: TextStyle(
                  fontFamily: "SansSerif",
                  fontSize: 17,
                  color: ColorItems().black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
