import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_conversation_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class SituationMainController extends GetxController {
  static SituationMainController get instance =>
      Get.find<SituationMainController>();

  Future<void> postBookmarkSituation() async {
    // conversationList.value.isbookmark = !situation.value.isbookmark!;
    // situation.refresh();
  }

  Future<void> getCoversationBysit(String situationid) async {
    conversationList.value = [];
    conversationList.refresh();
    ApiResponse<ConversationListResponse> response =
        await ApiService.instance.getConversationBySit(situationid);
    if (response.result) {
      conversationList.value = response.value!.conversationList!;
    }
    conversationList.refresh();
  }

  Future<void> getSituationList() async {
    ApiResponse<SituationListResponse> response =
        await ApiService.instance.getSituationList(UserService.instance.userId);
    if (response.result) {
      situationList.value = response.value!.situationList!;
    }
    situationList.refresh();
  }

  Future<void> getSituation(String situationid) async {
    ApiResponse<SituationResponse> response =
        await ApiService.instance.getSituation(situationid);
    if (response.result) {
      situation.value = response.value!.situation!;
    }
    situation.refresh();
  }

  RxList<Situation> situationList = <Situation>[].obs;
  Rx<Situation> situation = Situation().obs;
  // 선택한 Situation의 Conversation
  RxList<Conversation> conversationList = <Conversation>[].obs;
  RxList<bool> onTapList = List.filled(4, false).obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
