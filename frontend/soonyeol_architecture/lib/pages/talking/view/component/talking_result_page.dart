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
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF434343),
                ),
                alignment: Alignment.topLeft,
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children:[
                      Row(
                        
                children: [
                  
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 30.0),
                    child: Text(
                      '스피킹 평균 속도',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  // ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 80.0, top: 30.0),
                    child: Text(
                      'asdf',
                      style: TextStyle(fontSize: 24, color: Color(0xFF47CDD6)),
                    ),
                  // ),
                ),
               Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 30.0),
                    child: Text(
                      's',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  // ),
                
                ],
              ), 
              Row(
                        
                children: [
                  
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 30.0),
                    child: Text(
                      '대화 나눈 횟수',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  // ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 130.0, top: 30.0),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 24, color: Color(0xFF47CDD6)),
                    ),
                  // ),
                ),
               Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 30.0),
                    child: Text(
                      '회',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  // ),
                
                ],
              ),
              Row(
                        
                children: [
                  
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 30.0),
                    child: Text(
                      '대화 나눈 시간',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  // ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 110.0, top: 30.0),
                    child: Text(
                      '1.5',
                      style: TextStyle(fontSize: 24, color: Color(0xFF47CDD6)),
                    ),
                  // ),
                ),
               Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 30.0),
                    child: Text(
                      'm',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  // ),
                
                ],
              ),
              Row(
                        
                children: [
                  
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 30.0),
                    child: Text(
                      '토킹 점수',
                      style: TextStyle(fontSize: 24, color: Color(0xFF47CDD6)),
                    ),
                  // ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 180.0, top: 30.0),
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 24, color: Color(0xFF47CDD6)),
                    ),
                  // ),
                ),
               Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 30.0),
                    child: Text(
                      '점',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  // ),
                
                ],
              ),
                                 ]
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
              SizedBox(height: 40),
                Container(
                  width: Common.getWidth - 100,
                  height: 200,
                  // alignment: Alignment.center,
                  child: SingleChildScrollView(
                    
                    // physics: const BouncingScrollPhysics(),
                    // controller: controller.scrollcontroller.value,
                    child: Text(
                      '이곳에 긴 글을 넣어주세요. 이 글이 화면보다 길어지면 스크롤이 가능하도록 설정되었습니다. '
                      'Flutter는 이러한 기능을 지원하기 위해 SingleChildScrollView와 같은 다양한 위젯을 제공합니다. '
                      '이를 통해 사용자는 긴 컨텐츠를 편리하게 탐색할 수 있습니다. '
                      '글이 계속 이어지면, 이 글은 화면의 크기를 초과하여 아래로 확장됩니다. '
                      '따라서 사용자는 화면을 스크롤하여 글의 나머지 부분을 볼 수 있습니다. '
                      '이와 같이 Flutter는 사용자 경험을 향상시키기 위한 다양한 위젯과 도구를 제공합니다.',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      
                    ),
                  ),
                ),

              SizedBox(height: 50),
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