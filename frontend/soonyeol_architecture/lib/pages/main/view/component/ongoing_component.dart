import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

class OngoingComponent extends StatelessWidget {
  final Conversation model;
  const OngoingComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainViewController());
    return Container(
      padding: EdgeInsets.only(right: 15),
      width: 170,
      height: 153,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 242, 243, 242)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 13),
                      Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: Icon(
                          Icons.chat,
                          size: 35,
                          color: Color.fromARGB(255, 90, 144, 219),
                        ),
                      ),
                      SizedBox(height: 13),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${model.scenarioname}",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 15),
                              Text(
                                '마지막 대화: \nWhere am I? I want to drink water.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ))
                    ],
                  )))),
    );

    throw UnimplementedError();
  }
}