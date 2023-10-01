import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

class TalkingViewPage extends StatelessWidget {
  const TalkingViewPage({super.key});

  static const String url = '/talking';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TalkingViewController());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Align(alignment: Alignment.topCenter, child: Text('talking'))),
    );
  }
}
