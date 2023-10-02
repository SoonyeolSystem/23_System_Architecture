import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/dev_route/controller/route_view_controller.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_custom_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/component/talking_result_page.dart';

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
                child:
                    Text('Talking Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TalkingViewPage.url);
                },
              ),
              ElevatedButton(
                child: Text('Main Page', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(MainViewPage.url);
                },
              ),
              ElevatedButton(
                child: Text('Talking Custom Page',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TalkingCustomPage.url);
                },
              ),
              ElevatedButton(
                child: Text('Talking Result Page',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Get.offAllNamed(TalkingResultPage.url);
                },
              ),
            ]),
          ),
        ));
  }
}
