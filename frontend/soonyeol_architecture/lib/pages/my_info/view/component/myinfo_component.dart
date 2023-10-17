import 'package:flutter/material.dart';

import '../../../../restAPI/models/MyInfo.dart';

class InfoViewComponent extends StatelessWidget {
  final MyInfo model;
  const InfoViewComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(TalkingViewController());
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: ((context) {
              return Center(
                child: Container(
                    child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      child: Row(children: [
                        SizedBox(width: 20),
                        Text('${model.scenarioName}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ]),
                    )
                  ],
                )),
              );
            }));
      },
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${model.scenarioName}",
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          for (int i = 0; i < model.genre!.length; i++)
                            Row(
                              children: [
                                Text(
                                  "#",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: model.processivity == 0
                                        ? Color(0xFF33C26C)
                                        : Color.fromARGB(255, 255, 0, 0),
                                  ),
                                ),
                                Text(
                                  model.genre![i],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF808080),
                                  ),
                                ),
                                SizedBox(width: 5)
                              ],
                            ),
                        ],
                      )
                    ]),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 5, top: 2),
                  child: Icon(
                    Icons.delete_outline,
                    size: 30,
                    color: Color(0xFF888888),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
