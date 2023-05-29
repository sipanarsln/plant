import 'package:flutter/material.dart';
import 'package:plant_appv2/models/flower.dart';

class FlowerShop extends ChangeNotifier {
  final List<Flower> _flowers = [
    Flower(
        image: "assets/images/orkide.png",
        textName: "Orkide",
        description:
            "Orkide nemi çok seven bir bitki türüdür. Özellikle yaz aylarında yapraklarına günde bir kez püskürtme su uygulaman hoşuna gider. Yeterince nem olmazsa çiçek kendini korumaya alarak çiçek açmaktan vazgeçebilir.",
        light: "",
        water: "",
        temperature: ""),
    Flower(
      image: "assets/images/sukulent.png",
      textName: "Sukulent",
      description:
          "Sukulent bakımı kolay az su işteyen bir bitkidir. üşengeçler için birebir.",
      light: "",
      water: "",
      temperature: "",
    ),
    Flower(
      image: "assets/images/zanzibar.png",
      textName: "Zanzibar",
      description: "Bu bitkiye dair bir bilgi bulamadım.",
      light: "",
      water: "",
      temperature: "",
    ),
    Flower(
      image: "assets/images/licuala-orbicularis.png",
      textName: "Licuala Orbicularis",
      description: "Umarım ismi kadar şaşalıdır.",
      light: "",
      water: "",
      temperature: "",
    ),
  ];

  final List<Flower> _userCart = [];

  List<Flower> get flowerShop => _flowers;

  List<Flower> get userCart => _userCart;

  void addItemToCart(Flower flower) {
    _userCart.add(flower);
    notifyListeners();
  }

  void removeItemFromCart(Flower flower) {
    _userCart.remove(flower);
    notifyListeners();
  }
}
