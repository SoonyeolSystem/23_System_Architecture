import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

import '../../../../common/common.dart';

class TalkingResultPage extends StatelessWidget {
  const TalkingResultPage({super.key});

  static const String url = '/talking/result';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          width: Common.getWidth,
          color: Colors.black.withOpacity(0.9),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 50.0),
                    child: Text(
                      '좋은 대화였어요!',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: Common.getWidth - 100,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF434343),
                ),
                alignment: Alignment.center,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    '텍스트',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 50.0),
                    child: Text(
                      'GPT의 피드백',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 수행할 작업
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Color(0xFF47CDD6),
                    minimumSize: Size(400, 60),
                  ),
                  child: Text(
                    '대화 저장하기',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
