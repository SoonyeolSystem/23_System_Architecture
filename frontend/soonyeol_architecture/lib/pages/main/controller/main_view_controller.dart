import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_conversation_list_response.dart';

class MainViewController extends GetxController {
  static MainViewController get instance => Get.find<MainViewController>();

  // final List<Widget> bodyContent = [
  //   const MainViewPage(),
  //   const ConversationMainPage(),
  //   const MyInfoPage(),S
  // ];situation

  @override
  void onInit() async {
    super.onInit();
    await getBestConversationList();
  }

  Future<void> getBestConversationList() async {
    ApiResponse<ConversationListResponse> response = await ApiService.instance.getBestConversation();
    if (response.result) {
      bestConversationList.value = response.value!.conversationList!;
      bestConversationList.value = bestConversationList.value;
    }
    bestConversationList.refresh();
    // List<Map<String, dynamic>> fakeJsonData = [
    //   {
    //     "situationname": "비행기 난파 후 아무도 없는 사막에서 살아남기",
    //     "likeCount": 32,
    //     "views": 123,
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
    //     "situationname": "사막에서 살아남기2",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기3",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기4",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기5",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기6",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기7",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기8",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기9",
    //     "likeCount": 31,
    //     "views": 10,
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
    //     "situationname": "사막에서 살아남기10",
    //     "likeCount": 31,
    //     "views": 10,
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
    // List<Conversation> fakeConversations = fakeJsonData.map((jsonData) => Conversation.fromJson(jsonData)).toList();
    // bestConversationList.value = fakeConversations;
    // bestConversationList.refresh();
  }

  RxList<Conversation> bestConversationList = <Conversation>[].obs;

  RxInt bookmarkCount = 5.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
