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
  var speechText = 'press the Mic button  and start speaking'.obs;
  late SpeechToText speechToText;

  FlutterTts tts = FlutterTts();
  final TextEditingController con = TextEditingController();

  Map<String, String> parameters = {};

  void passParameter(Map<String, String> parameters) {
    this.parameters = parameters;
    channel = WebSocketChannel.connect(Uri.parse(
        '${'${Common.websocketUrl}?situation=${parameters['situation']}&genre=${parameters['genre']}&name=${parameters['name']}'}&character=${parameters['character']}&situationid=${parameters['situationid']}&userid=${UserService.instance.userID}}&conversationid=${parameters['conversationid']}'));
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
    channel?.sink.close();
    tts.stop();
    super.onClose();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize(
        onStatus: (val) {},
        onError: (val) {},
      );
      if (available) {
        isListening.value = true;
        speechToText.listen(onResult: (val) {
          speechText.value = val.recognizedWords;
        });
      }
    } else {
      isListening.value = false;
      speechToText.stop();
      sendMesage();
      speechText.value = '';
    }
  }

  void sendMesage() {
    channel?.sink.add(jsonEncode({'action': 'sendMessage', 'script': speechText.value}));
  }

  void receiveMessage() {
    channel?.stream.listen((event) {
      final response = jsonDecode(event) as Map<String, dynamic>;
      print(response);
      ScriptResponse scriptResponse = ScriptResponse.fromJson(response);
      if (scriptResponse.scriptHistory != null && scriptResponse.statusCode == "200") {
        talkingList.value = scriptResponse.scriptHistory!;
        talkingList.refresh();
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
  RxString scenarioname = '사막에서 살아남기'.obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
