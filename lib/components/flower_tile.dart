// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:plant_appv2/pages/details/details_screen.dart';

import '../constants/constants_color.dart';
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
                color: const Color(0xffebfdf2),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(3, 4), blurRadius: 5)
                ]),
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          child: Container(
            height: 50,
            width: 170,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: Color(0xff6B8A77),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black, offset: Offset(-1, 2), blurRadius: 6)
              // ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Image.asset(
            flower.image,
            height: 150,
          ),
        ),
        Positioned(
          top: 140,
          left: 20,
          child: Text(
            flower.textName,
            style: const TextStyle(
                fontFamily: "SansSerif",
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 130,
          left: 145,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(flower)));
            },
            icon: const Icon(
              Icons.arrow_right_outlined,
              color: Colors.amber,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
