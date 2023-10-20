import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Common extends GetxService {
  static Common get instance => Get.find<Common>();
  static const bool isDev = true;
  static Logger logger = Logger(filter: MyFilter());
  static const String baseUrl = "https://localhost:8000/";
  static const String authbaseUrl = "https://localhost:8003/";
  static const String websocketUrl = "ws://localhost:8000/";

  static double get getWidth => GetPlatform.isMobile ? Get.width : 500;
  static double get getHeight => GetPlatform.isMobile ? Get.height : 1000;
  Future<Common> init() async {
    Common.logger.d('$runtimeType init!');
    return this;
  }
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return Common.isDev ? true : false;
  }
}
