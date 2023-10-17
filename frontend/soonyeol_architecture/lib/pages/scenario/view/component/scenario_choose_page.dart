import 'package:flutter/material.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

class ScenarioChoosePage extends StatelessWidget {
  final Scenario model;
  const ScenarioChoosePage({super.key, required this.model});

  static const url = '/scenario_choose_page';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Common.getWidth,
      child: Column(children: [
        Expanded(
            child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${model.scenarioname}",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ]),
              ),
            )
          ],
        ))
      ]),
    );
  }
}
