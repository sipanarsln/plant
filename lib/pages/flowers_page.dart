import 'package:flutter/material.dart';
import 'package:plant_appv2/components/flower_tile.dart';
import 'package:plant_appv2/models/flower.dart';
import 'package:plant_appv2/models/flower_shop.dart';
import 'package:provider/provider.dart';

import 'details/details_screen.dart';

class FlowersPage extends StatefulWidget {
  const FlowersPage({super.key});

  @override
  State<FlowersPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<FlowersPage> {
  void addToCart(Flower flower) {
    Provider.of<FlowerShop>(context, listen: false).addItemToCart(flower);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlowerShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: FlowerShop().flowerShop.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    Flower eachFlower = value.flowerShop[index];
                    return FlowerTile(
                        flower: eachFlower,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(eachFlower),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
