import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/dev_route/view/route_view_page.dart';

import '../../../../common/common.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String url = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controller = TextEditingController();
  String? _errorText;
  static const String url = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
            width: Common.getWidth,
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  elevation: 0.0,
                  centerTitle: true,
                  title: Text(''),
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      Get.offAllNamed(RouteViewPage.url);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                
                Material(
                  type: MaterialType.transparency,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 10.0),
                      child: Text(
                        '회원가입',
                        style: TextStyle(fontSize: 27, color: Colors.black),
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
                      controller: _controller,
                      obscureText: true,
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
                      obscureText: true,
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
                // SizedBox(height: 20),
      
                Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: EdgeInsets.only(left: 220.0, top: 10),
                    child: Container(
                      height: 30, // 설정한 높이
                      child: _errorText != null
                          ? Row(
                              children: <Widget>[
                                Icon(Icons.warning, color: Colors.red),
                                SizedBox(width: 5),
                                Text(
                                  _errorText!,
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 20),
                                )
                              ],
                            )
                          : null,
                    ),
                  ),
                ),
      
                Material(
                  type: MaterialType.transparency,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 45.0, top: 25.0),
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
                      if (_controller.text.length < 6) {
                        setState(() {
                          _errorText = '6자리 이상 입력해주세요';
                        });
                      } else {
                        setState(() {
                          _errorText = null;
                        });
                      }
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
                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
