import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/restAPI/response/script_response.dart';
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

  FlutterTts tts = FlutterTts();
  final TextEditingController con = TextEditingController();

  Map<String, String> parameters = {};
  RxBool isLoaded = false.obs;

  void passParameter(Map<String, String> parameters) {
    this.parameters = parameters;
    channel = WebSocketChannel.connect(Uri.parse(
        '${'${Common.websocketUrl}?situation=${parameters['situation']}&genre=${parameters['genre']}&name=${parameters['name']}'}&character=${parameters['character']}&situationid=${parameters['situationid']}&userid=${UserService.instance.userID}}&conversationid=${parameters['conversationid']}&title=${parameters['title']}'));
    receiveMessage();
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
        Talking newTalking = Talking(character:  Get.arguments['name'],
          script: speechText.value,
          isMe: "1",);
         talkingList.add(newTalking);
        scrollcontroller.value.animateTo(scrollcontroller.value.position.maxScrollExtent, duration: const Duration(milliseconds: 10), curve: Curves.ease);
        speechToText.listen(onResult: (val) {
        speechText.value = val.recognizedWords;
        talkingList.last.script = val.recognizedWords;
        talkingList.refresh();
        
        });
        
      }
    } else {
      isLoaded.value = true;
      isListening.value = false;
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

  RxList<Talking> talkingList = <Talking>[].obs;
  RxDouble speakingSpeed = 15.0.obs;
  RxInt speakingCount = 20.obs;
  RxDouble speakingTime = 2.4.obs;
  RxInt talkingScore = 80.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
