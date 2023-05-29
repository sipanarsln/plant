import 'package:flutter/material.dart';

import '../../models/flower.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Flower flower;
  const DetailsScreen(this.flower, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        flower,
      ),
    );
  }
}
