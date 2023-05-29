// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:plant_appv2/constants/constants_color.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.center,
          backgroundColor: const Color(0xff6B8A77),
          tabBorderRadius: 50,
          gap: 4,
          onTabChange: (value) => onTabChange!(value),
          color: ColorItems().white,
          activeColor: const Color(0xff3e441a),
          tabBackgroundColor: const Color(0xffd7e7d1),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Behçem",
            ),
            GButton(
              icon: Icons.home,
              text: "Çiçekler",
            ),
          ],
        ),
      ),
    );
  }
}
