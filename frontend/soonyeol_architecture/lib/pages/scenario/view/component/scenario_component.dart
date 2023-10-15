import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

import '../../controller/scenario_main_controller.dart';

class ScenarioComponent extends StatelessWidget {
  final Scenario model;
  const ScenarioComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScenarioMainController());

    return Container(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${model.scenarioname}",
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(width: 2),
                      Text("#${model.genre![0]} #${model.genre![1]}",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                    ]),
              ),
              const Spacer(),
              if (model.isbookmark == true)
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 3),
                            Icon(Icons.star, size: 15, color: Colors.yellow),
                            SizedBox(width: 3),
                            Text("${model.bookmarkcount}",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text("조회수 ${model.views}",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ]),
                ),
              if (model.isbookmark == false)
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 3),
                            Icon(Icons.star_border,
                                size: 15, color: Colors.grey),
                            SizedBox(width: 3),
                            Text("${model.bookmarkcount}",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text("조회수 ${model.views}",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ]),
                ),
            ],
          ),
        )
      ]),
    );
  }
}
