import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kartal/kartal.dart';

import '../../../constants/constants_color.dart';
import '../../../models/flower.dart';

class SicaklikCart extends StatelessWidget {
  final Flower flower;
  const SicaklikCart({
    super.key,
    required this.flower,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: ColorItems().darkGrey),
          color: ColorItems().white),
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/celcius.png",
              width: 35,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            Text(
              "Sıcaklık",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.normal,
                color: ColorItems().darkGrey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              flower.temperature,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: ColorItems().black,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
