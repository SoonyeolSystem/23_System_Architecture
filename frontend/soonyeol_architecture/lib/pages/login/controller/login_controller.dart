import 'package:get/get.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class LoginController extends GetxController{
    static LoginController get instance => Get.find<LoginController>();

  var isLoading=false.obs;

  Future<void> login(String loginId, String password) async {
    //Loading
    isLoading.value = true;

    await UserService.instance.login(loginId, password);

    //Loading finish
    isLoading.value = false;
  }
}