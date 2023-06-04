// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:plant_appv2/constants/constants_color.dart';
import '../models/flower.dart';
import '../models/flower_shop.dart';
import '../service/notificationmanager.dart';

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

class _FlowerMyGardenTileState extends State<FlowerMyGardenTile>
    with TickerProviderStateMixin {
  void removeFromCart(Flower flower) {
    Provider.of<FlowerShop>(context, listen: false).removeItemFromCart(flower);
  }

  final NotificationManager notificationManager = NotificationManager();

  final TextEditingController textFieldController = TextEditingController();

  late AnimationController controller;

  bool isPlaying = false;

  int count = 0;

  int? countPut;

  String? valueText;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return "${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, "0")}:${(count.inSeconds % 60).toString().padLeft(2, "0")}";
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(days: count),
    )..addStatusListener((status) {
        if (status == AnimationStatus.dismissed && controller.value == 0.0) {
          notificationManager.simpleNotificationShow();
        }
      });

    notificationManager.initNotification(); // Bildirim yöneticisini başlat
  }

  @override
  void dispose() {
    controller.dispose(); // AnimationController'ın Ticker'ını dispose edin
    notificationManager.dispose(); // Bildirim yöneticisini kapatın
    super.dispose();
  }

  void geriSar() {
    controller.reset();
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    setState(() {
      isPlaying = false;
    });
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
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Çiçeğinizi sulamak istediğiniz gün sayısını yazınız"),
                                content: TextField(
                                  onChanged: (value) {
                                    valueText = value;
                                  },
                                  controller: textFieldController,
                                  decoration: InputDecoration(
                                      hintText: "Kaç günde bir ?"),
                                ),
                                actions: [
                                  MaterialButton(
                                    child: Text("Tamam"),
                                    onPressed: () {
                                      setState(() {
                                        count = int.tryParse(
                                                textFieldController.text) ??
                                            0;
                                        controller.duration =
                                            Duration(days: count);
                                        controller.reverse(
                                          from: 1.0,
                                        );
                                        isPlaying = true;
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
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
                          onPressed: geriSar,
                          icon: const Icon(
                            Icons.water_drop_outlined,
                            size: 40,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              removeFromCart(widget.flower);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
