import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/situation/view/situation_each_view_page.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';

import '../../controller/situation_main_controller.dart';

class SituationComponent extends StatelessWidget {
  final Situation model;
  const SituationComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = SituationMainController.instance;
    return InkWell(
      onTap: () async {
        await controller.getSituation(model.situationId ?? "");
        await controller.getCoversationBysit(model.situationId ?? "");
        Get.toNamed(SituationEachPage.url, arguments: model);
      },
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: 330,
                    child: Text("${model.title}", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Text(
                        "#",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF33C26C),
                        ),
                      ),
                      Text(
                        "${model.genre}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF808080),
                        ),
                      ),
                      const SizedBox(width: 5)
                    ],
                  )
                ]),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Row(
                    children: [
                      const SizedBox(height: 3),
                      Icon(
                        model.isLike == true ? CupertinoIcons.star_fill : CupertinoIcons.star,
                        size: 15,
                        color: model.isLike == true ? Colors.yellow : const Color(0xFF434343),
                      ),
                      const SizedBox(width: 3),
                      Text("${model.likeCount}", style: const TextStyle(fontSize: 15, color: Color(0xFF434343), fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text("플레이 수 ${model.play}회", style: const TextStyle(fontSize: 13, color: Color(0xFF434343), fontWeight: FontWeight.w500)),
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
