import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Common extends GetxService {
  static Common get instance => Get.find<Common>();
  static const bool isDev = true;
  static Logger logger = Logger(filter: MyFilter());
  static const String userServiceUrl = "http://43.201.70.13:7001/user/";
  static const String communityServiceUrl = "http://43.201.70.13:7001/community/";
  // static const String userServiceUrl = "http://127.0.0.1:8081/";
  // static const String communityServiceUrl = "http://127.0.0.1:8080/";
  static const String websocketUrl = "wss://h78bsknjuf.execute-api.ap-northeast-2.amazonaws.com/dev";
  // static const String userServiceUrl="https://kq7a0ulv2i.execute-api.ap-northeast-2.amazonaws.com/";
  static double get getWidth => GetPlatform.isMobile ? Get.width : 500;
  static double get getHeight => GetPlatform.isMobile ? Get.height : 1000;
  Future<Common> init() async {
    Common.logger.d('$runtimeType init!');
    return this;
  }

  DateTime epochTimeToDateTime(int epcohTime) {
    return DateTime.fromMillisecondsSinceEpoch(epcohTime * 1000);
  }
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return Common.isDev ? true : false;
  }
}
