import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_conversation_list_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class MyInfoViewController extends GetxController {
  static MyInfoViewController get instance => Get.find<MyInfoViewController>();
  @override
  void onInit() async {
    super.onInit();
    await getInfoList();
  }

  Future<void> getInfoList() async {
    ApiResponse<ConversationListResponse> response = await ApiService.instance.getConversationListByUserID(UserService.instance.userId);
    if (response.result) {
      myConversation.value = response.value!.conversationList!;
    }
    myConversation.refresh();
    completeSituation.value  = 0;
    totalscore.value = 0;
    speakingCount.value = 0;
    speakingTime.value = 0;
    for (int index = 0; index < myConversation.length; index++) {
      if (myConversation[index].endStory == true) {
        completeSituation += 1;
        totalscore.value += int.parse(myConversation[index].rate!);
        talkingScore.value = (totalscore / completeSituation.value).toStringAsFixed(1);
        speakingCount.value += myConversation[index].timerlist!.length;
        //speakingTime.value += myConversation[index].speaktime;
      }
    }
  }

  // Future<void> getConversationUnfinished() async {
  //   // myConversationUnfinished.value = [];
  //   // myConversationUnfinished.refresh();
  //   ApiResponse<ConversationListResponse> response = await ApiService.instance.getConversationUnfinished(UserService.instance.userId);
  //   if (response.result) {
  //     myConversationUnfinished.value = response.value!.conversationList!;
  //   }
  //   myConversationUnfinished.refresh();
  // }

  int getNotEndStoryLength() {
    int count = 0;
    for (int index = 0; index < myConversation.length; index++) {
      if (myConversation[index].endStory == false) {
        count += 1;
      }
    }
    return count;
  }

  RxList<Conversation> myConversation = <Conversation>[].obs;
  // RxList<Conversation> myConversationUnfinished = <Conversation>[].obs;

  RxInt speakingTime = 0.obs;
  RxInt speakingCount = 0.obs;
  RxString talkingScore = '0'.obs;
  RxInt completeSituation = 0.obs;
  RxInt totalscore = 0.obs;
  // RxString nickname= "".obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
