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
    double screenWidth = MediaQuery.of(context).size.width;
    //final controller = Get.put(TalkingViewController());
    return Container(
      //width: 300,
      padding: model.character == "me"
          ? EdgeInsets.only(
              top: 10, bottom: 25, left: screenWidth * 0.25, right: 10)
          : EdgeInsets.only(
              top: 10, bottom: 25, right: screenWidth * 0.25, left: 10),
      //padding: const EdgeInsets.only(top: 20, bottom: 20, left: 200),
      alignment: model.character == "me"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        textAlign: model.character == "me" ? TextAlign.right : TextAlign.left,
        model.script ?? '???',
        style: const TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}
