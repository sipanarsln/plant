import 'package:flutter/material.dart';
import 'package:plant_appv2/models/flower.dart';

class FlowerShop extends ChangeNotifier {
  final List<Flower> _flowers = [
    Flower(
        image: "assets/images/orkide.png",
        textName: "Orkide",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        light: "xx Hour",
        water: "xx Ml",
        temperature: "xx °C"),
    Flower(
      image: "assets/images/sukulent.png",
      textName: "Sukulent",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      light: "xx Hour",
      water: "xx Ml",
      temperature: "xx °C",
    ),
    Flower(
      image: "assets/images/zanzibar.png",
      textName: "Zanzibar",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      light: "xx Hour",
      water: "xx Ml",
      temperature: "xx °C",
    ),
    Flower(
      image: "assets/images/licuala-orbicularis.png",
      textName: "Licuala",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      light: "xx Hour",
      water: "xx Ml",
      temperature: "xx °C",
    ),
    Flower(
        image: "assets/images/orkide.png",
        textName: "Orkide",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        light: "xx Hour",
        water: "xx Ml",
        temperature: "xx °C"),
    Flower(
      image: "assets/images/sukulent.png",
      textName: "Sukulent",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      light: "xx Hour",
      water: "xx Ml",
      temperature: "xx °C",
    ),
    Flower(
      image: "assets/images/zanzibar.png",
      textName: "Zanzibar",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      light: "xx Hour",
      water: "xx Ml",
      temperature: "xx °C",
    ),
    Flower(
      image: "assets/images/licuala-orbicularis.png",
      textName: "Licuala",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      light: "xx Hour",
      water: "xx Ml",
      temperature: "xx °C",
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
