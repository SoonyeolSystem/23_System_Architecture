import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/pages/dev_route/view/route_view_page.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/signup/view/sign_up_page.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/response/login_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

import '../../../../common/common.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String url = '/login';

  @override
  Widget build(BuildContext context) {
    final loginIdController = TextEditingController();
    final passwordController = TextEditingController();
    final UserService userService = Get.find<UserService>();
    // UserService userService = UserService.instance;

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
                  title: const Text(''),
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      //Get.offAllNamed(RouteViewPage.url);
                      Get.back();
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 10.0),
                      child: Text(
                        '로그인',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 45.0, top: 30.0),
                      child: Text(
                        'ID',
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF888888)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Material(
                  child: Container(
                    width: Common.getWidth - 80,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFF3F8F5),
                    ),
                    child: TextFormField(
                      controller: loginIdController,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 45.0, top: 40.0),
                      child: Text(
                        'Password',
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFF888888)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Material(
                  child: Container(
                    width: Common.getWidth - 80,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFF3F8F5),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20, top: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      String loginId = loginIdController.text;
                      String password = passwordController.text;

                      ApiResponse<LoginResponse> response =
                          await ApiService.instance.login(loginId, password);

                      if (response.statusCode == 200) {
                        // 로그인 성공
                        Get.offAllNamed(MainViewPage.url);

                        Get.snackbar("success", "로그인에 성공하였습니다.");
                        userService.userId=response.userId!;
                        userService.nickname = response.nickname!;
                        userService.isLogin = true;
                        Get.snackbar('User ID: ${userService.userId}', 'Nickname: ${userService.nickname}');

                        Common.logger.d('User ID: ${userService.userId}');
Common.logger.d('Nickname: ${userService.nickname}');
                      } else if (response.statusCode == 400) {
                        // ID가 존재하지 않음
                        Get.snackbar(
                            "ID/Password not Found", "ID/비밀번호가 존재하지 않습니다.");
                      } else {
                        // 기타 오류   
                        Get.snackbar(
                            "Error", response.errorMsg ?? "알 수 없는 오류가 발생했습니다.");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.blue,
                      backgroundColor: const Color(0xFF33C26C),
                      minimumSize: const Size(420, 60),
                    ),
                    child: const Text(
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
                        padding: const EdgeInsets.only(right: 60.0, top: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(SignUpPage.url);
                          },
                          child: const Text(
                            '회원가입',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF888888)),
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
