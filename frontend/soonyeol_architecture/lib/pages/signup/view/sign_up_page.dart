import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String url = '/signup';

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
              Container(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                                    padding: EdgeInsets.only(left: 10.0, top: 10.0),

                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF888888),
                  size: 40.0, // 아이콘의 크기를 40으로 설정
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 40.0),
                    child: Text(
                      '회원가입',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 45.0, top: 40.0),
                    child: Text(
                      'ID',
                      style: TextStyle(fontSize: 22, color: Color(0xFF888888)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
                child: Container(
                  width: Common.getWidth - 80,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF3F8F5),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '아이디',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFACACBC),
                      ),
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                    ),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 45.0, top: 40.0),
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 22, color: Color(0xFF888888)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
                child: Container(
                  width: Common.getWidth - 80,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF3F8F5),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '6자리 이상',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFACACBC),
                      ),
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                child: Container(
                  width: Common.getWidth - 80,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF3F8F5),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '비밀번호 재입력',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFACACBC),
                      ),
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                    ),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 45.0, top: 40.0),
                    child: Text(
                      '닉네임',
                      style: TextStyle(fontSize: 22, color: Color(0xFF888888)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
                child: Container(
                  width: Common.getWidth - 80,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF3F8F5),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: '6자리 이상',
                      // hintStyle: TextStyle(
                      //   fontSize: 20,
                      //   color: Color(0xFFACACBC),
                      // ),
                      contentPadding: EdgeInsets.only(left: 20, top: 10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 수행할 작업
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Color(0xFF33C26C),
                    minimumSize: Size(420, 60),
                  ),
                  child: Text(
                    'Login',
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
