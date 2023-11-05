import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';

class ConversationComponent extends StatelessWidget {
  final Conversation model;
  const ConversationComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    return InkWell(
      onTap: () {
        Get.toNamed(TalkingViewPage.url);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFFE3F4F9),
                      child: Icon(
                        CupertinoIcons.person_fill,
                        size: 39,
                        color: Color.fromARGB(255, 148, 148, 148),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${model.userName}",
                              style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              model.epcohTime == null ? "알 수 없음" : savedTime(Common.instance.epochTimeToDateTime(model.epcohTime!)),
                              style: const TextStyle(fontSize: 12, color: Color(0xFF808080)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          model.headScript!,
                          style: const TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),
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
                          model.isLike == true ? Icons.favorite : Icons.favorite_border,
                          size: 22,
                          color: const Color.fromARGB(255, 242, 96, 108), //const Color.fromARGB(255, 229, 91, 86),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${model.likeCount}',
                          style: const TextStyle(fontSize: 14, color: Color(0xFF434343)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "조회수 ${model.views}회",
                      style: const TextStyle(fontSize: 14, color: Color(0xFF434343)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String savedTime(DateTime savedTime) {
  var nowTime = DateTime.now();

  int difference = nowTime.difference(savedTime).inSeconds;
  if (difference < 60) {
    return '방금 전';
  }

  difference = nowTime.difference(savedTime).inMinutes;

  if (difference < 60) {
    return '$difference분 전';
  } else {
    if (difference < 720) {
      return '${difference ~/ 60}시간 전';
    } else {
      if (difference < 1440) {
        return DateFormat('h:mm').format(savedTime);
      } else {
        return DateFormat('MM/dd').format(savedTime);
      }
    }
  }
}
