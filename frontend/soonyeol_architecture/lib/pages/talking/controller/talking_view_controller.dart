import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/response/like_response.dart';
import 'package:soonyeol_architecture/restAPI/response/script_response.dart';
import 'package:soonyeol_architecture/restAPI/response/talking_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../restAPI/models/Talking.dart';

class TalkingViewController extends GetxController {
  static TalkingViewController get instance => Get.find<TalkingViewController>();

  late final WebSocketChannel? channel;
  var isListening = false.obs;
  var speechText = ''.obs;
  late SpeechToText speechToText;
  final stopwatch = Stopwatch();

  FlutterTts tts = FlutterTts();
  final TextEditingController con = TextEditingController();

  RxMap parameters = {'situationid': ""}.obs;
  RxBool isLoaded = false.obs;

//  Future<void> getConversationList() async {
//     ApiResponse<ConversationListResponse> response = await ApiService.instance.getConversationListByUserID(UserService.instance.userId);
//     if (response.result) {
//       myConversation.value = response.value!.conversationList!;
//     }
//     myConversation.refresh();

  // Future<void> likeConversation() async {
  //   // if (parameters['conversationid'] != null && parameters['userid'] != null) {
  //   // String conversationId = parameters['conversationid'];
  //   // String userId = parameters['userid'];

  //   Conversation conversation = Conversation();
  //   String userId = UserService.instance.userId;
  //   String conversationId = parameters['conversationid'];
  //   // String userId = user.userId ?? "";
  //   Common.logger.d('Conversation ID: $conversationId');
  //   Common.logger.d('User ID: $userId');

  //   ApiResponse<LikeResponse> likeResponse = await ApiService.instance.likeConversation(conversationId, userId);

  //   if (likeResponse.result) {
  //     isLike = !isLike;
  //   } else {}
  //
  // }

  Future<void> likeConversation(String conversationId, String userId) async {
    ApiResponse<LikeResponse> response = await ApiService.instance.likeConversation(conversationId, userId);
    if (response.result) {
      await getTalkingListByConID(conversationId);
      UserService.instance.reloadData();
    } else {}
  }

  Future<void> unlikeConversation(String conversationId, String userId) async {
    ApiResponse<String> response = await ApiService.instance.unlikeConversation(conversationId, userId);
    if (response.result) {
      await getTalkingListByConID(conversationId);
      UserService.instance.reloadData();
    }
  }

  Future<void> getTalkingListByConID(String conversationId) async {
    ApiResponse<TalkingResponse> response = await ApiService.instance.getTalkingListByConID(conversationId);
    if (response.result) {
      talkingList.value = response.value!.scriptHistory;
      talkingList.refresh();
      conversation.value.isLike = response.value!.isLike;
      conversation.value.likeCount = response.value!.likeCount;
      conversation.refresh();
    }
  }

  void passParameter(Map parameters) async {
    isLoaded.value = true;
    this.parameters.value = parameters;
    this.parameters.refresh();

    if ('true'.compareTo(parameters['new']) != 0) {
      await getTalkingListByConID(parameters['conversationid']);
    }
    channel = WebSocketChannel.connect(Uri.parse(
        '${Common.websocketUrl}?situation=${parameters['situation']}&genre=${parameters['genre']}&name=${parameters['name']}&character=${parameters['character']}&situationid=${parameters['situationid']}&userid=${UserService.instance.userId}&conversationid=${parameters['conversationid']}&title=${parameters['title']}'));

    receiveMessage();
    isLoaded.value = false;
  }

  @override
  void onInit() async {
    super.onInit();
    speechToText = SpeechToText();
    await getTalkingList();
  }

  @override
  void onClose() {
    if (channel != null) {
      channel?.sink.close();
    }
    
    tts.stop();
    super.onClose();
  }

  void listen() async {
    if (!isListening.value && !isLoaded.value) {
      bool available = await speechToText.initialize(
        onStatus: (val) {},
        onError: (val) {},
      );
      if (available) {
        isListening.value = true;
        speechText.value = '';
        stopwatch.start();
        Talking newTalking = Talking(
          character: Get.arguments['name'],
          script: speechText.value,
          isMe: "1",
        );
        talkingList.add(newTalking);
        talkingList.refresh();

        speechToText.listen(onResult: (val) {
          scrollcontroller.value.animateTo(scrollcontroller.value.position.maxScrollExtent, duration: const Duration(milliseconds: 10), curve: Curves.ease);
          speechText.value = val.recognizedWords;
          talkingList.last.changeScript(val.recognizedWords);
          talkingList.refresh();
        });
      }
    } else {
      isLoaded.value = true;
      isListening.value = false;

      //통계내기 시작
      stopwatch.stop();

      sendMesage(speechText.value);
      speechToText.stop();
      speechText.value = '';
      

    }
  }

  void sendMesage(String text) {
    channel?.sink.add(jsonEncode({'action': 'sendMessage', 'script': text}));
  }

  void receiveMessage() {
    channel?.stream.listen((event) async {
      final response = jsonDecode(event) as Map<String, dynamic>;
      print(response);
      ScriptResponse scriptResponse = ScriptResponse.fromJson(response);
      isLoaded.value = false;
      if (scriptResponse.scriptHistory != null && scriptResponse.statusCode == "200") {
        talkingList.value = scriptResponse.scriptHistory!;
        talkingList.refresh();
        textTospeech(scriptResponse.scriptHistory!.last.script!);
        await Future.delayed(const Duration(milliseconds: 100));
        scrollcontroller.value.animateTo(scrollcontroller.value.position.maxScrollExtent, duration: const Duration(milliseconds: 100), curve: Curves.ease);
      } else {
        Get.snackbar("Error", "에러가 발생하였습니다.");
      }
    }, onError: (err) {
      Get.back();
      Get.snackbar("Error", "서버와의 연결이 끊어졌습니다.");
    });
  }

  Future<void> getTalkingList() async {
    // List<Map<String, dynamic>> fakeJsonData = [
    //   {"character": "me", "script": "Oh my god! Where are we?"},
    //   {"character": "you", "script": "I have no idea, but we need to find water and shelter fast!"},
    //   {"character": "me", "script": "But I can't see anything but sand here!"},
    //   {"character": "you", "script": "Let's start walking in that direction. Maybe we'll find something."},
    //   {"character": "me", "script": "Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?"},
    //   {"character": "you", "script": "I have no idea, but we need to find water and shelter fast!"},
    //   {"character": "me", "script": "Oh my god! Where are we?"},
    //   {"character": "you", "script": "I have no idea, but we need to find water and shelter fast!"},
    //   {"character": "me", "script": "Oh my god! Where are we?"},
    //   {"character": "you", "script": "I have no idea"},
    //   {"character": "me", "script": "Oh my god! Where are we? gggggggg okay let's take a look."},
    //   {"character": "you", "script": "hello!"},
    //   {"character": "me", "script": "Oh my god! Where are we?"},
    //   {"character": "you", "script": "I have no idea, but we need to find water and shelter fast!"},
    // ];

    // List<Talking> fakeTalkings = fakeJsonData.map((jsonData) => Talking.fromJson(jsonData)).toList();
    // talkingList.value = fakeTalkings;
    // talkingList.refresh();
  }

  Future<void> textTospeech(String text) async {
    tts.setLanguage("en-US");
    tts.setSpeechRate(1);

    await tts.speak(text);
  }

  Rx<Conversation> conversation = Conversation().obs;

  RxList<Talking> talkingList = <Talking>[].obs;
  RxDouble speakingSpeed = 15.0.obs;
  RxDouble speakingTime = 2.4.obs;
  RxInt talkingScore = 80.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
