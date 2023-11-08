import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/dio_extension.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_conversation_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_response.dart';
import 'package:soonyeol_architecture/restAPI/response/login_response.dart';
import 'package:soonyeol_architecture/restAPI/response/sign_up_response.dart';
import 'package:soonyeol_architecture/restAPI/response/talking_response.dart';

class ApiService extends GetxService {
  static ApiService get instance => Get.find();
  Dio userDio = Dio(BaseOptions(baseUrl: Common.userServiceUrl));
  Dio communityDio = Dio(BaseOptions(baseUrl: Common.communityServiceUrl));

  Future<ApiService> init() async {
    Common.logger.d('$runtimeType init!');
    if (Common.isDev) {
      userDio.interceptors.add(PrettyDioLogger());
    }
    return this;
  }

  Future<ApiResponse<ConversationListResponse>> getBestConversation() async {
    try {
      var response = await communityDio.get('/community/bestconversation');
      ConversationListResponse getConversationListResponse = ConversationListResponse.fromJson(response.data);
      return ApiResponse<ConversationListResponse>(result: response.isSuccessful, value: getConversationListResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<ConversationListResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<ConversationListResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<ConversationListResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<TalkingResponse>> getTalkingListByConID(String Conversationid) async {
    try {
      var response = await communityDio.get('/community/talking/$Conversationid');
      TalkingResponse getTalkingListResponse = TalkingResponse.fromJson(response.data);

      return ApiResponse<TalkingResponse>(result: response.isSuccessful, value: getTalkingListResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<TalkingResponse>(result: false, errorMsg: e.response?.data ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<TalkingResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<TalkingResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<String>> deleteConversationByID(String id) async {
    try {
      var response = await communityDio.delete('/user/conversation/$id');
      return ApiResponse<String>(result: response.isSuccessful, value: response.data['message']);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<String>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<String>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<String>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<ConversationListResponse>> getConversationListByUserID(String userID) async {
    try {
      var response = await communityDio.get('/user/conversation/$userID');
      ConversationListResponse getConversationListResponse = ConversationListResponse.fromJson(response.data);
      return ApiResponse<ConversationListResponse>(result: response.isSuccessful, value: getConversationListResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<ConversationListResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<ConversationListResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<ConversationListResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<SituationListResponse>> getSituationList() async {
    try {
      var response = await communityDio.get('/community/situationlist');
      SituationListResponse getClassRoomListResponse = SituationListResponse.fromJson(response.data);
      return ApiResponse<SituationListResponse>(result: response.isSuccessful, value: getClassRoomListResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<SituationListResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<SituationListResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<SituationListResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<SituationResponse>> getSituation(int id) async {
    try {
      var response = await userDio.get(
        '/situation/situation/$id',
        data: jsonEncode({}),
      );
      SituationResponse getClassRoomResponse = SituationResponse.fromJson(response.data);
      return ApiResponse<SituationResponse>(result: response.isSuccessful, value: getClassRoomResponse);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<SituationResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<SituationResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<SituationResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<LoginResponse>> login(String loginId, String password) async {
    try {
      var response = await userDio.post(
        '/user/login',
        data: jsonEncode({
          'loginId': loginId,
          'password': password,
        }),
      );
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return ApiResponse<LoginResponse>(
        result: response.data['statusCode'] == "200",
        value: loginResponse,
        statusCode: int.parse(response.data['statusCode']),
        userId: response.data['userId'],
        nickname: response.data['nickname'],
      );
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<LoginResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.", statusCode: e.response?.statusCode);
      } catch (e) {
        return ApiResponse<LoginResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<LoginResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<SignUpResponse>> signup(String loginId, String password, String nickname) async {
    try {
      var response = await userDio.post(
        '/user/signup',
        data: jsonEncode({
          'loginId': loginId,
          'password': password,
          'nickname': nickname,
        }),
      );

      SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);
      return ApiResponse<SignUpResponse>(
          result: response.data['statusCode'] == "200", value: signUpResponse, statusCode: int.parse(response.data['statusCode']));
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<SignUpResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.", statusCode: e.response?.statusCode);
      } catch (e) {
        return ApiResponse<SignUpResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<SignUpResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }
}
