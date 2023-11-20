import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/common/dio_extension.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/models/Evaluation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_conversation_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_response.dart';
import 'package:soonyeol_architecture/restAPI/response/like_response.dart';
import 'package:soonyeol_architecture/restAPI/response/login_response.dart';
import 'package:soonyeol_architecture/restAPI/response/sign_up_response.dart';
import 'package:soonyeol_architecture/restAPI/response/talking_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

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

  Future<ApiResponse<Evaluation>> evaluateConversation(String conversationid) async {
    try {
      var response = await communityDio.put('/end/$conversationid');
      Evaluation evaluation = Evaluation.fromJson(response.data);
      return ApiResponse<Evaluation>(result: response.isSuccessful, value: evaluation);
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<Evaluation>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.");
      } catch (e) {
        return ApiResponse<Evaluation>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<Evaluation>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<ConversationListResponse>> getConversationBySit(String situationID) async {
    try {
      var response = await communityDio.get(
        '/community/conversation/bysit',
        queryParameters: {'situationid': situationID, 'userid': UserService.instance.userId},
      );
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

  Future<ApiResponse<ConversationListResponse>> getBestConversation() async {
    try {
      var response = await communityDio.get('/community/bestconversation/${UserService.instance.userId}');
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

  Future<ApiResponse<TalkingResponse>> getTalkingListByConID(String id) async {
    try {
      var response = await communityDio.get(
        '/community/talking',
        queryParameters: {'conversationid': id, 'userid': UserService.instance.userId},
      );
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

  Future<ApiResponse<ConversationListResponse>> getConversationUnfinished(String userID) async {
    try {
      var response = await communityDio.get('/user/conversation/unfinished/$userID');

      ConversationListResponse getunConversationListResponse = ConversationListResponse.fromJson(response.data);
      return ApiResponse<ConversationListResponse>(result: response.isSuccessful, value: getunConversationListResponse, statusCode: response.statusCode);
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

  Future<ApiResponse<SituationListResponse>> getSituationList(String userID) async {
    try {
      var response = await communityDio.get('/community/situationlist/$userID');
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

  Future<ApiResponse<SituationListResponse>> getLikeSituationlist(String userID) async {
    try {
      var response = await communityDio.get('/community/situation/like/$userID');
      SituationListResponse getLikesituationResponse = SituationListResponse.fromJson(response.data);
      return ApiResponse<SituationListResponse>(result: response.isSuccessful, value: getLikesituationResponse);
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

  Future<ApiResponse<SituationResponse>> getSituation(String situationid) async {
    try {
      var response = await communityDio.get(
        '/community/situation',
        queryParameters: {'situationid': situationid, 'userid': UserService.instance.userId},
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

  Future<ApiResponse<LikeResponse>> likeConversation(String conversationId, String userId) async {
    try {
      var response = await userDio.post(
        '/like/conversation',
        queryParameters: {'conversationid': conversationId, 'userid': userId},
      );

      LikeResponse likeResponse = LikeResponse.fromJson(response.data);

      return ApiResponse<LikeResponse>(
        result: response.statusCode == 200,
        value: likeResponse,
      );
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<LikeResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.", statusCode: e.response?.statusCode);
      } catch (e) {
        return ApiResponse<LikeResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<LikeResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<LikeResponse>> likeSituation(String situationId, String userId) async {
    try {
      var response = await userDio.post(
        '/like/situation',
        queryParameters: {
          'situationid': situationId,
          'userid': userId,
        },
      );

      LikeResponse likeResponse = LikeResponse.fromJson(response.data);

      return ApiResponse<LikeResponse>(
        result: response.statusCode == 200,
        value: likeResponse,
      );
    } on DioError catch (e) {
      Common.logger.d(e);
      try {
        return ApiResponse<LikeResponse>(result: false, errorMsg: e.response?.data['message'] ?? "오류가 발생했습니다.", statusCode: e.response?.statusCode);
      } catch (e) {
        return ApiResponse<LikeResponse>(result: false, errorMsg: "오류가 발생했습니다.");
      }
    } catch (e) {
      Common.logger.d(e);
      return ApiResponse<LikeResponse>(result: false, errorMsg: "오류가 발생했습니다.");
    }
  }

  Future<ApiResponse<String>> unlikeSituation(String situationId, String userId) async {
    try {
      var response = await userDio.delete('/like/situation', queryParameters: {'situationid': situationId, 'userid': userId});
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

  Future<ApiResponse<String>> unlikeConversation(String conversationId, String userId) async {
    try {
      var response = await userDio.delete('/like/conversation', queryParameters: {'conversationid': conversationId, 'userid': userId});
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
