import 'package:get/get.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  var isLoading = false.obs;

  Future<void> login(String loginId, String password) async {
    //Loading
    if (isLoading.value) {
      return; // 이미 로딩 중이면 true를 반환
    }
    isLoading.value = true;

    await UserService.instance.login(loginId, password);

    //Loading finish
    isLoading.value = false;
  }
}
