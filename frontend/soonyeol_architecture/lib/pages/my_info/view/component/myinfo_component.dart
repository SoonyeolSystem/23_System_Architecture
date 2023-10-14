import 'package:flutter/material.dart';
import '../../../../restAPI/models/MyInfo.dart';

class InfoViewComponent extends StatelessWidget {
  final MyInfo model;
  const InfoViewComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //final controller = Get.put(TalkingViewController());
    return Container(
      //width: 300,
      padding: model.character == "me"
          ? EdgeInsets.only(
              top: 0, bottom: 20, left: screenWidth * 0.25, right: 10)
          : EdgeInsets.only(
              top: 10, bottom: 20, right: screenWidth * 0.25, left: 10),
      //padding: const EdgeInsets.only(top: 20, bottom: 20, left: 200),
      alignment: model.character == "me"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: model.character == "me"
          ? CrossAxisAlignment.end
          :CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: model.character == "me" ? TextAlign.right : TextAlign.left,
            model.character ?? '???',
            style: const TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            textAlign: model.character == "me" ? TextAlign.right : TextAlign.left,
            model.script ?? '???',
            style: const TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(height: 10),
          if (model.character == "you")  InkWell(child: const Icon(Icons.volume_up_rounded, size:20, color: Colors.grey),onTap:(){print("speak");})
        ],
      ),
    );

  }
}
