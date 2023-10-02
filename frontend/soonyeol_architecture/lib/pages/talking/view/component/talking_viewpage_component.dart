import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';
import '../../../../restAPI/models/Talking.dart';

class TalkingViewComponent extends StatelessWidget {
  final Talking model;
  const TalkingViewComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(TalkingViewController());
    return Text(
      '${model.line ?? '???'}',
      style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
    );
  }
}
