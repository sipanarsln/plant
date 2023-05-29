// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:plant_appv2/constants/constants_color.dart';
import 'package:plant_appv2/pages/details/details_screen.dart';

import '../models/flower.dart';
import '../models/flower_shop.dart';

class FlowerMyGardenTile extends StatefulWidget {
  final Flower flower;
  final TextEditingController? controller;

  const FlowerMyGardenTile({
    Key? key,
    required this.flower,
    this.controller,
  }) : super(key: key);

  @override
  State<FlowerMyGardenTile> createState() => _FlowerMyGardenTileState();
}

class _FlowerMyGardenTileState extends State<FlowerMyGardenTile> {
  void removeFromCart(Flower flower) {
    Provider.of<FlowerShop>(context, listen: false).removeItemFromCart(flower);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorItems().white,
        boxShadow: const [
          BoxShadow(
              color: Color(0xff6B8A77), offset: Offset(3, 3), blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 90,
            width: 80,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(widget.flower.image), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.flower.textName,
                  style: TextStyle(
                      fontFamily: "SansSerif",
                      fontSize: 20,
                      color: ColorItems().black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              title: const Text("Sulama Aralığı"),
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              content: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove)),
                                        const Text("data"),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                    Container(
                                        alignment: Alignment.bottomRight,
                                        child: const Icon(
                                          Icons.abc,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.alarm_add,
                          color: Colors.red,
                          size: 40,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.water_drop_outlined,
                            size: 40,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                removeFromCart(widget.flower);
              },
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
