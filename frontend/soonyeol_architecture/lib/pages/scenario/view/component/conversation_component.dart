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
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFE3F4F9),
                child: Icon(
                  CupertinoIcons.person_fill,
                  size: 39,
                  color: Color.fromARGB(255, 148, 148, 148),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "${model.userName}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${model.conversation![0]}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    model.isLike == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 29,
                    color: Color.fromARGB(255, 233, 57, 51),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${model.likeCount}',
                    style:
                        const TextStyle(fontSize: 17, color: Color(0xFF434343)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "조회수 ${model.views}회",
                style: const TextStyle(fontSize: 18, color: Color(0xFF434343)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
