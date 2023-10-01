import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

class TalkingCustomPage extends StatelessWidget {
  final TalkingViewController model;
  const TalkingCustomPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TalkingViewController());

    return InkWell();
  }
}
