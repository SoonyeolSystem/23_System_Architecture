import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  bool logining = false;
  Future<UserService> init() async {
    Common.logger.d('$runtimeType init!');

    return this;
  }
}
