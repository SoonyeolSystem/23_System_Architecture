import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/response/login_response.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  String userId = 'null';
  String nickname = '';
  bool isLoading = false; // 로딩 상태를 나타내는 변수 추가
  bool isResponseBlocked = false; // 다른 리스폰스를 막는 변수 추가

  Future<UserService> init() async {
    Common.logger.d('$runtimeType init!');

    Common.logger.d('User ID: $userId');
    Common.logger.d('Nickname: $nickname');
    return this;
  }

  Future<void> login(String loginId, String password) async {
    ApiResponse<LoginResponse> response = await ApiService.instance.login(loginId, password);

    if (response.statusCode == 200) {
      // 로그인 성공
      userId = response.userId!;
      nickname = response.nickname!;
      await MyInfoViewController.instance.getInfoList();
      Get.offAllNamed(MainViewPage.url);

      Get.snackbar("success", "로그인에 성공하였습니다.");
      Get.snackbar('User ID: $userId', 'Nickname: $nickname');

      Common.logger.d('User ID: $userId');
      Common.logger.d('Nickname: $nickname');
    } else if (response.statusCode == 400) {
      // ID가 존재하지 않음
      Get.snackbar("ID/Password not Found", "ID/비밀번호가 존재하지 않습니다.");
    } else {
      // 기타 오류
      Get.snackbar("Error", response.errorMsg ?? "알 수 없는 오류가 발생했습니다.");
    }
  }

  bool isLogin() {
    if (userId == 'null' && nickname.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    userId = '';
    nickname = '';
  }
}
