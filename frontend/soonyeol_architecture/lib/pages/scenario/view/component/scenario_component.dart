import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/widget/panel_component.dart';
import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

import '../../controller/scenario_main_controller.dart';

class ScenarioComponent extends StatelessWidget {
  final Scenario model;
  const ScenarioComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: ((context) {
              return Container(
                  child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Row(children: [
                      SizedBox(width: 20),
                      Text('${model.scenarioname}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ]),
                  )
                ],
              ));
            }));
      },
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
                                    color: Color(0xFF33C26C),
                                  ),
                                ),
                                Text(
                                  "${model.genre![i]}",
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
              if (model.isbookmark == true)
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 3),
                            Icon(Icons.star, size: 20, color: Colors.yellow),
                            SizedBox(width: 3),
                            Text("${model.bookmarkcount}",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xFF434343))),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text("조회수 ${model.views}회",
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF434343))),
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
                                size: 20, color: Color(0xFF434343)),
                            SizedBox(width: 3),
                            Text("${model.bookmarkcount}",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xFF434343))),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text("조회수 ${model.views}회",
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF434343))),
                      ]),
                ),
            ],
          ),
        )
      ]),
    );
  }
}
