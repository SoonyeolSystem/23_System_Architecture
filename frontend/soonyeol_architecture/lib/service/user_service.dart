import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  bool logining = false;
  bool isLogin = false;
  String userId = '';
  String nickname = '';
  Future<UserService> init() async {
    Common.logger.d('$runtimeType init!');

    Common.logger.d('User ID: ${userId}');
    Common.logger.d('Nickname: ${nickname}');
    return this;
  }
  
}
