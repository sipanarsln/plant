class Flower {
  final String textName, description, image, light, temperature, water;

  Flower({
    required this.temperature,
    required this.water,
    required this.light,
    required this.image,
    required this.textName,
    required this.description,
  });

  void dispose() {}
}
