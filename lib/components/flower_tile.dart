// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_appv2/constants/constants_color.dart';
import 'package:plant_appv2/pages/details/details_screen.dart';

import '../models/flower.dart';

// ignore: must_be_immutable
class FlowerTile extends StatelessWidget {
  final Flower flower;
  void Function()? onTap;
  FlowerTile({
    Key? key,
    required this.flower,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 10,
          child: Container(
            height: 115,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorItems().greenFeta,
                boxShadow: [
                  BoxShadow(
                      color: ColorItems().viridianGreen,
                      offset: Offset(3, 4),
                      blurRadius: 5)
                ]),
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          child: Container(
            height: 50,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: ColorItems().viridianGreen,
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black, offset: Offset(-1, 2), blurRadius: 6)
              // ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 0,
          child: Image.asset(
            flower.image,
            height: 150,
          ),
        ),
        Positioned(
          top: 140,
          left: 25,
          child: Text(
            flower.textName,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 17,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Positioned(
          top: 130,
          left: 140,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(flower)));
            },
            icon: Icon(
              Icons.arrow_right_outlined,
              color: ColorItems().amber,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
