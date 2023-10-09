import 'package:flutter/material.dart';

import '../../../../common/common.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  static const String url = '/info';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Container(
          width: Common.getWidth,
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 30.0, bottom: 30),
                    child: Text(
                      '홍길동 님의 정보',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 250,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 50,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '총 학습 시간',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '17분',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.question_answer,
                          size: 50,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '총 말한 문장',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '17분',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 250,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.emoji_events,
                          size: 50,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '대화 평균 점수',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '7.8점',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.movie,
                          size: 50,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          '완료한 시나리오',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '3개',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
