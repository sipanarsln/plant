import 'package:flutter/material.dart';
import 'package:plant_appv2/components/flower_tile.dart';
import 'package:plant_appv2/models/flower_shop.dart';
import 'package:provider/provider.dart';

import '../components/flower_mygarden_tile.dart';
import '../models/flower.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlowerShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      Flower eachFlower = value.userCart[index];
                      return FlowerMyGardenTile(flower: eachFlower);
                    }),
                // child: GridView.builder(
                //   itemCount: value.userCart.length,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2),
                //   itemBuilder: (context, index) {
                //     Flower eachFlower = value.userCart[index];

                //     return FlowerTile(
                //       flower: eachFlower,
                //     );
                //   },
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
