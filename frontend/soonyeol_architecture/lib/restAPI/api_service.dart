import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:soonyeol_architecture/common/common.dart';

class ApiService extends GetxService {
  static ApiService get instance => Get.find();

  Dio dio = Dio(BaseOptions(baseUrl: Common.baseUrl, headers: {"Authorization": "Bearer 0000"}));
  Future<ApiService> init() async {
    Common.logger.d('$runtimeType init!');
    if (Common.isDev) {
      dio.interceptors.add(PrettyDioLogger());
    }
    return this;
  }
}
