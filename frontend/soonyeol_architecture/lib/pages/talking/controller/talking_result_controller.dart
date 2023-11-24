import 'package:get/get.dart';
import 'package:soonyeol_architecture/restAPI/models/Evaluation.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class TalkingResultController extends GetxController {
  @override
  void onInit() {
    Evaluation response = Get.arguments;
    talkingScore.value = response.rate!;
    evaluation.value = response.evaluation!;
    talkingCount.value = response.speakingcount!;
    speakingSpeed.value = ((response.speakingSpeed!/talkingCount.value!)/1000);
    speakingTime.value = ((response.speakingTime!));
    super.onInit();
  }

  @override
  void onClose() {
    UserService.instance.reloadData();
    super.onClose();
  }

  Rxn<double> speakingSpeed = Rxn<double>();
  Rxn<int> speakingTime = Rxn<int>();
  Rxn<int> talkingScore = Rxn<int>();
  Rxn<int> talkingCount = Rxn<int>();
  RxString evaluation = "채점 중입니다...".obs;
}
