import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/signup/view/sign_up_page.dart';

import '../../../../common/common.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String url = '/login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 50.0),
                    child: Text(
                      '로그인',
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
                      // hintText: 'ID',
                      // hintStyle: TextStyle(
                      //   fontSize: 20,
                      //   color: Color(0xFF888888),
                      // ),
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
                                      obscureText : true,

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
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
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 60.0, top: 30.0),
                    child: GestureDetector(
  onTap: () {
    Get.toNamed(SignUpPage.url);
  },
  child: Text(
    '회원가입',
    style: TextStyle(fontSize: 18, color: Color(0xFF888888)),
  ),
)
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
