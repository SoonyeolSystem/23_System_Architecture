import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_conversation_list_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class MainViewController extends GetxController {
  static MainViewController get instance => Get.find<MainViewController>();

  @override
  void onInit() async {
    super.onInit();
    await getConversationUnfinished();
    await getBestConversationList();
  }

  Future<void> getBestConversationList() async {
    ApiResponse<ConversationListResponse> response = await ApiService.instance.getBestConversation();
    if (response.result) {
      bestConversationList.value = response.value!.conversationList!;
      bestConversationList.value = bestConversationList.value;
    }

    bestConversationList.refresh();
  }

  Future<void> getConversationUnfinished() async {
    // myConversationUnfinished.value = [];
    // myConversationUnfinished.refresh();
    ApiResponse<ConversationListResponse> response = await ApiService.instance.getConversationUnfinished(UserService.instance.userId);
    if (response.result) {
      myConversationUnfinished.value = response.value!.conversationList!;
      myConversationUnfinished.value = myConversationUnfinished.value;
    }
    myConversationUnfinished.refresh();
  }

  RxList<Conversation> myConversationUnfinished = <Conversation>[].obs;
  RxList<Conversation> bestConversationList = <Conversation>[].obs;
  RxList<Conversation> conversationList = <Conversation>[].obs;

  RxList<Conversation> ongoingConversationList = <Conversation>[].obs;

  //RxInt bookmarkCount = 5.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
