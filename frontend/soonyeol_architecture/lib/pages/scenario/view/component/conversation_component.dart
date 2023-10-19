import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';

class ConversationComponent extends StatelessWidget {
  final Conversation model;
  const ConversationComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainViewController());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFFE3F4F9),
              child: Icon(
                CupertinoIcons.person_fill,
                size: 30,
                color: Color.fromARGB(255, 148, 148, 148),
              ),
            ),
          ),
        ],
      ),
    );
  }
}