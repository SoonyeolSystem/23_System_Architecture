import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_list_response.dart';

class SituationMainController extends GetxController {
  static SituationMainController get instance => Get.find<SituationMainController>();

  Future<void> postBookmarkSituation() async {
    // conversationList.value.isbookmark = !situation.value.isbookmark!;
    // situation.refresh();
  }

  Future<void> getSituationList() async {
    ApiResponse<SituationListResponse> response = await ApiService.instance.getSituationList();
    if (response.result) {
      situationList.value = response.value!.situationList!;
    }
    situationList.refresh();

    // List<Map<String, dynamic>> fakeJsonData = [
    //   {
    //     "title": "비행기 난파 후 아무도 없는 사막에서 살아남기",
    //     "bookmarkCnt": 32,
    //     "play": 123,
    //     "isLike": true,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자1",
    //     "userName": "Miso",
    //     "conversation": ["Oh my god! Where are we? There's nothing except desert ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기2",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기3",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": true,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기4",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기5",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기6",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기7",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": true,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime(2023, 10, 31, 2),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기8",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기9",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    //   {
    //     "title": "사막에서 살아남기10",
    //     "bookmarkCnt": 31,
    //     "play": 10,
    //     "isLike": false,
    //     "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": "재난, 생존",
    //     "character": "생존자1,생존자2",
    //     "maincharacter": "생존자3",
    //     "userName": "SOjeong",
    //     "conversation": ["Hey thanos! You'd better... ", "I don't know... "],
    //     "saved_time": DateTime.now(),
    //     "end_story": "false"
    //   },
    // ];
    // List<Situation> fakeSituations = fakeJsonData.map((jsonData) => Situation.fromJson(jsonData)).toList();
    // situationList.value = fakeSituations;
    // situationList.refresh();
  }

  RxList<Situation> situationList = <Situation>[].obs;
  // 선택한 Situation의 Conversation
  RxList<Conversation> conversationList = <Conversation>[].obs;
  RxList<bool> onTapList = List.filled(4, false).obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
