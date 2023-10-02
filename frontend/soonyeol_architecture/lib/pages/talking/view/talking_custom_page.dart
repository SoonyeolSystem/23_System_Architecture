import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

import '../../../common/common.dart';

class TalkingCustomPage extends StatelessWidget {
  const TalkingCustomPage({super.key});

  static const String url = '/talking/custom';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          width: Common.getWidth,
          color: Colors.black.withOpacity(0.9),
          child: Column(
            children: [Material()],
          ),
        ),
      ),
    );
  }
}
