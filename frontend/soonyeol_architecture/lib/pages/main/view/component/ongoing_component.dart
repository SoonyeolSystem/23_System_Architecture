import 'package:flutter/material.dart';
import 'package:soonyeol_architecture/common/move/moveService.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';

class OngoingComponent extends StatelessWidget {
  final Conversation model;
  const OngoingComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;
    return Container(
      padding: const EdgeInsets.only(right: 15),
      width: 175,
      height: 153,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                MoveService.instance.moveTalkingPageByConversation(model, true);
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(131, 205, 206, 209), Color.fromARGB(255, 215, 224, 230)],
                      //color: Color.fromARGB(255, 233, 236, 239)
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 13),
                      const Padding(
                        padding: EdgeInsets.only(right: 100.0),
                        child: Icon(
                          Icons.chat,
                          size: 35,
                          color: Color.fromARGB(255, 90, 144, 219),
                        ),
                      ),
                      const SizedBox(height: 13),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.situationname ?? "알 수 없음",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 43, 43, 43),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '마지막 대화: \n${model.headScript}',
                                style: const TextStyle(
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
