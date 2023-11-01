import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/STT/view/stt_page.dart';
import 'package:soonyeol_architecture/pages/TTS/tts.dart';
import 'package:soonyeol_architecture/pages/dev_route/controller/route_view_controller.dart';
import 'package:soonyeol_architecture/pages/login/view/login_page.dart';
import 'package:soonyeol_architecture/pages/main/view/navigation.dart';
import 'package:soonyeol_architecture/pages/signup/view/sign_up_page.dart';
import 'package:soonyeol_architecture/pages/situation/view/situation_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_custom_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_result_page.dart';

class RouteViewPage extends StatelessWidget {
  const RouteViewPage({super.key});

  static const String url = '/route';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RouteViewController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(children: [
              const Text('RouteViewPage'),
              ElevatedButton(
                child: const Text('Go to Main Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(Navigation.url);
                },
              ),
              ElevatedButton(
                child: const Text('Talking Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TalkingViewPage.url);
                },
              ),
              ElevatedButton(
                child: const Text('Talking Custom Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TalkingCustomPage.url);
                },
              ),
              ElevatedButton(
                child: const Text('Talking Result Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TalkingResultPage.url);
                },
              ),
              // ElevatedButton(
              //   child: Text('Situation Page',
              //       style: TextStyle(color: Colors.black)),
              //   onPressed: () {
              //     Get.offAllNamed(SituationMainPage.url);
              //   },
              // ),
              ElevatedButton(
                child: const Text('Situation Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(SituationMainPage.url);
                },
              ),
              ElevatedButton(
                child: const Text('Login Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(LoginPage.url);
                },
              ),
              ElevatedButton(
                child: const Text('Sign Up Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(SignUpPage.url);
                },
              ),
              ElevatedButton(
                child: const Text('STT Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(STTPage.url);
                },
              ),
              ElevatedButton(
                child: const Text('TTS Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TTSPage.url);
                },
              ),
            ]),
          ),
        ));
  }
}
