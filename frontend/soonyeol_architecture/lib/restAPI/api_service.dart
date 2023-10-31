import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/dio_extension.dart';

import 'package:soonyeol_architecture/restAPI/response/get_scenario_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_scenario_response.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/response/login_response.dart';
import 'package:soonyeol_architecture/restAPI/response/sign_up_response.dart';

class ApiService extends GetxService {
  static ApiService get instance => Get.find();
  Dio dio = Dio(BaseOptions(
      baseUrl: Common.baseUrl));
    
  Future<ApiService> init() async {
    Common.logger.d('$runtimeType init!');
    if (Common.isDev) {
      dio.interceptors.add(PrettyDioLogger());
    }
    return this;
  }

  Future<ApiResponse<ScenarioListResponse>> getScenarioList() async {
    try {
      var response = await dio.get(
        '/scenario/scenarios',
        data: jsonEncode({}),
      );
      ScenarioListResponse getClassRoomListResponse =
          ScenarioListResponse.fromJson(response.data);
      return ApiResponse<ScenarioListResponse>(
          result: response.isSuccessful, value: getClassRoomListResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<ScenarioListResponse>(
            result: false,
            errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<ScenarioListResponse>(
            result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      return ApiResponse<ScenarioListResponse>(
          result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<ScenarioResponse>> getScenario(int id) async {
    try {
      var response = await dio.get(
        '/scenario/scenario/$id',
        data: jsonEncode({}),
      );
      ScenarioResponse getClassRoomResponse =
          ScenarioResponse.fromJson(response.data);
      return ApiResponse<ScenarioResponse>(
          result: response.isSuccessful, value: getClassRoomResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<ScenarioResponse>(
            result: false,
            errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<ScenarioResponse>(
            result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      return ApiResponse<ScenarioResponse>(
          result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<LoginResponse>> login(String userId, String password) async {
  try {

    var response = await dio.post(
      '/user/login',
      data: jsonEncode({
        'userId': userId,
        'password': password,
      }),
    );
    LoginResponse loginResponse = LoginResponse.fromJson(response.data);
    return ApiResponse<LoginResponse>(
    result: response.data['statusCode'] == "200", 
    value: loginResponse,
    statusCode: int.parse(response.data['statusCode'])
);
  } on DioError catch (e) {
    Common.logger.d(e);
    try {
      return ApiResponse<LoginResponse>(
          result: false,
          errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.",
          statusCode: e.response?.statusCode);
    } catch (e) {
      return ApiResponse<LoginResponse>(
          result: false, errorMsg: "오류가 발생했습니다.");
    }
  } catch (e) {
    return ApiResponse<LoginResponse>(
        result: false, errorMsg: "오류가 발생했습니다.");
  }
}
Future<ApiResponse<SignUpResponse>> signup(String userId, String password, String nickname) async {
  try {
    var response = await dio.post(
      '/user/signup', 
      data: jsonEncode({
        'userId': userId,
        'password': password,
        'nickname': nickname,
      }),
    );

    SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
    return ApiResponse<SignUpResponse>(
        result: response.data['statusCode'] == "200",
    value: signUpResponse,
    statusCode: int.parse(response.data['statusCode']));

  } on DioError catch (e) {
    Common.logger.d(e);
    try {
      return ApiResponse<SignUpResponse>(
          result: false,
          errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.",
          statusCode: e.response?.statusCode  
          );
    } catch (e) {
      return ApiResponse<SignUpResponse>(
          result: false, errorMsg: "오류가 발생했습니다.");
    }
  } catch (e) {
    return ApiResponse<SignUpResponse>(
        result: false, errorMsg: "오류가 발생했습니다.");
  }
}


}
