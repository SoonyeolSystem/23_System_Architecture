import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/pages/dev_route/view/route_view_page.dart';
import 'package:soonyeol_architecture/pages/login/view/login_page.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/response/sign_up_response.dart';

import '../../../../common/common.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String url = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final loginIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nicknameController = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      Get.offAllNamed(LoginPage.url);
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
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF888888)),
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
                      controller: loginIdController,
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
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF888888)),
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
                      controller: passwordController,
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
                      controller: confirmPasswordController,
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
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
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
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF888888)),
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
                      controller: nicknameController,
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
                    onPressed: () async {
                      
                      String loginId = loginIdController.text;
                      String password = passwordController.text;
                      String confirmPassword = confirmPasswordController.text;
                      String nickname = nicknameController.text;

                      // if (validateInputs(userId, password, confirmPassword, nickname)) {
                      // 회원가입을 시도
                      
                      if (passwordController.text.length < 6) {
                        setState(() {
                          _errorText = '6자리 이상 입력해주세요';
                        });
                      } else{
                        setState(() {
                          _errorText = null;
                        });
                        ApiResponse<SignUpResponse> response = await ApiService
                          .instance
                          .signup(loginId, password, nickname);
                          if (password != confirmPassword) {
                        Get.snackbar("Error", "비밀번호가 일치하지 않습니다.");
                      } else if (response.statusCode == 200) {
                        // 회원가입 성공
                        Get.offAllNamed(LoginPage.url);
                        Get.snackbar("Success", "회원가입이 성공적으로 완료되었습니다.");
                      }else if(response.statusCode==401){
                        // 회원가입 실패, 에러 메시지 처리
                        Get.snackbar(
                            "Error",  "이미 존재하는 ID입니다.");
                      }else if(response.statusCode==402){
                        // 회원가입 실패, 에러 메시지 처리
                        Get.snackbar(
                            "Error",  "이미 존재하는 닉네임입니다.");
                      }
                      else {
                        // 회원가입 실패, 에러 메시지 처리
                        Get.snackbar(
                            "Error", "회원가입 중 오류가 발생했습니다.");
                      }
                      }
                      
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      backgroundColor: Color(0xFF33C26C),
                      minimumSize: Size(420, 60),
                    ),
                    child: Text(
                      '가입',
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
