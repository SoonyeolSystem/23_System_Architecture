import 'package:get/get.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class TalkingResultController extends GetxController {
  @override
  void onInit() {
    evaluateTalking(Get.arguments);
    super.onInit();
  }

  Future<void> evaluateTalking(String ConversationID) async {
    final response = await ApiService.instance.evaluateConversation(ConversationID);
    if (response.result) {
      // speakingSpeed.value = response.value!.speakingSpeed!;
      // speakingTime.value = response.value!.speakingTime!;
      talkingScore.value = response.value!.rate!;
      evaluation.value = response.value!.evaluation!;
    }
  }

  @override
  void onClose() {
    UserService.instance.reloadData();
    super.onClose();
  }

  Rx<double?> speakingSpeed = null.obs;
  Rx<double?> speakingTime = null.obs;
  Rx<int?> talkingScore = null.obs;
  RxString evaluation = "채점 중입니다...".obs;
}
