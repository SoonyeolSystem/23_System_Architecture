import 'package:flutter/material.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

import '../../../../restAPI/models/Talking.dart';

class TalkingViewComponent extends StatelessWidget {
  final Talking model;
  const TalkingViewComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = TalkingViewController.instance;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      //width: 300,
      padding: model.isMe == "1"
          ? EdgeInsets.only(top: 0, bottom: 20, left: screenWidth * 0.25, right: 10)
          : EdgeInsets.only(top: 10, bottom: 20, right: screenWidth * 0.25, left: 10),
      //padding: const EdgeInsets.only(top: 20, bottom: 20, left: 200),
      alignment: model.isMe == "1" ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: model.isMe == "1" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: model.isMe == "1" ? TextAlign.right : TextAlign.left,
            model.character ?? '???',
            style: const TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            textAlign: model.isMe == "1" ? TextAlign.right : TextAlign.left,
            model.script ?? '???',
            style: const TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(height: 10),
          if (model.isMe == "0")
            InkWell(
                child: const Icon(Icons.volume_up_rounded, size: 20, color: Colors.grey),
                onTap: () {
                  controller.textTospeech(model.script!);
                })
        ],
      ),
    );
  }
}
