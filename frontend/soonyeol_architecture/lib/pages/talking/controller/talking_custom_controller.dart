import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TalkingCustomViewController extends GetxController {
  static TalkingCustomViewController get instance => Get.find<TalkingCustomViewController>();

  final TextEditingController titleC = TextEditingController();
  final TextEditingController situationC =
      TextEditingController(text: "Choi Jee-Woo asks David Beckham to take her picture, but he seems to have a crush on her.");
  final TextEditingController genreC = TextEditingController(text: "Romance");
  final TextEditingController nameC = TextEditingController(text: "Choi Jeewoo");
  final TextEditingController characterC = TextEditingController(text: "David Beckham");

  @override
  void onClose() {
    situationC.dispose();
    genreC.dispose();
    nameC.dispose();
    characterC.dispose();
    titleC.dispose();
    super.onClose();
  }
}
