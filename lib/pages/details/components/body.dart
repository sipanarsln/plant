// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:plant_appv2/models/flower_shop.dart';
import 'package:plant_appv2/pages/details/components/%C4%B1s%C4%B1k.dart';
import 'package:plant_appv2/pages/details/components/sicaklik.dart';
import 'package:provider/provider.dart';
import '../../../constants/constants_color.dart';
import '../../../models/flower.dart';
import 'miktar.dart';

class Body extends StatefulWidget {
  final Flower flower;

  const Body(this.flower, {super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void addToCart(Flower flower) {
    Provider.of<FlowerShop>(context, listen: false).addItemToCart(flower);
  }

  bool isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<FlowerShop>(
        builder: (context, value, child) => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Image.asset(
                        widget.flower.image,
                        fit: BoxFit.cover,
                        height: 400,
                        width: size.width,
                      ),
                      Padding(
                        padding: context.onlyTopPaddingMedium * 1.3 +
                            context.onlyRightPaddingLow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios_outlined),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Bahçeye eklendi.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "SansSerif",
                                        fontSize: 20,
                                        color: ColorItems().black),
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: ColorItems().lightLightGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ));
                                addToCart(widget.flower);

                                setState(
                                  () {
                                    isButtonEnabled = false;
                                  },
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: const Text("ekle"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 700,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffebfdf2)),
                      ),
                      Padding(
                        padding: context.onlyTopPaddingLow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 150),
                                height: 5,
                                width: size.width,
                                color: ColorItems().lightLightGrey),
                            const SizedBox(height: 10),
                            Padding(
                              padding: context.onlyLeftPaddingLow,
                              child: Text(
                                widget.flower.textName,
                                style: TextStyle(
                                    fontFamily: "SansSerif",
                                    fontSize: 30,
                                    color: ColorItems().black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MiktarCart(
                                  flower: widget.flower,
                                ),
                                IsikCart(
                                  flower: widget.flower,
                                ),
                                SicaklikCart(flower: widget.flower),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              endIndent: 10,
                              indent: 10,
                              thickness: 1,
                              color: ColorItems().darkGrey,
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: context.onlyLeftPaddingLow,
                              child: Text(
                                "Hakkında",
                                style: TextStyle(
                                  fontFamily: "SansSerifLight",
                                  fontSize: 30,
                                  color: ColorItems().black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: context.onlyLeftPaddingLow,
                              child: Text(
                                widget.flower.description,
                                style: TextStyle(
                                  fontFamily: "SansSerifLight",
                                  fontSize: 15,
                                  color: ColorItems().darkGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text("Bahçeye eklendi"),
      action: SnackBarAction(
          label: "UNDO", onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
