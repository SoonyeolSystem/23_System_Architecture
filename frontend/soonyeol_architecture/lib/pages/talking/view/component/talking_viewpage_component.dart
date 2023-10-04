import 'package:flutter/material.dart';
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
              top: 0, bottom: 20, left: screenWidth * 0.25, right: 10)
          : EdgeInsets.only(
              top: 10, bottom: 20, right: screenWidth * 0.25, left: 10),
      //padding: const EdgeInsets.only(top: 20, bottom: 20, left: 200),
      alignment: model.character == "me"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: model.character == "me" ? TextAlign.right : TextAlign.left,
            model.script ?? '???',
            style: const TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 15),
          if (model.character == "you") const Icon(Icons.volume_up_rounded, size:20, color: Colors.grey)
        ],
      ),
    );

  }
}
