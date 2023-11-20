import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_controller.dart';
import 'package:soonyeol_architecture/pages/situation/controller/situation_main_controller.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/response/login_response.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  String userId = 'null';
  String nickname = '';
  bool isLoading = false; // 로딩 상태를 나타내는 변수 추가
  bool isResponseBlocked = false; // 다른 리스폰스를 막는 변수 추가

  Future<UserService> init() async {
    const storage = FlutterSecureStorage();

    userId = await storage.read(key: 'userId') ?? 'null';
    nickname = await storage.read(key: 'nickname') ?? '';

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

      const storage = FlutterSecureStorage();

      await storage.write(key: 'userId', value: userId);
      await storage.write(key: 'nickname', value: nickname);

      Common.logger.d('User ID: $userId');
      Common.logger.d('Nickname: $nickname');
      reloadData();
    } else if (response.statusCode == 400) {
      // ID가 존재하지 않음
      Get.snackbar("ID/Password not Found", "ID/비밀번호가 존재하지 않습니다.");
    } else {
      // 기타 오류
      Get.snackbar("Error", response.errorMsg ?? "알 수 없는 오류가 발생했습니다.");
    }
  }

  bool isLogin() {
    if (userId != 'null' && nickname.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    userId = 'null';
    nickname = '';
    const storage = FlutterSecureStorage();

    storage.delete(key: 'userId');
    storage.delete(key: 'nickname');

    reloadData();
  }

  void reloadData() {
    MyInfoViewController.instance.getInfoList();
    MainViewController.instance.getBestConversationList();
    SituationMainController.instance.getSituationList();
  }
}
