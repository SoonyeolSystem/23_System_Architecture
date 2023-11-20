import 'package:get/get.dart';
import 'package:soonyeol_architecture/restAPI/models/Evaluation.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class TalkingResultController extends GetxController {
  @override
  void onInit() {
    Evaluation response = Get.arguments;
    talkingScore.value = response.rate!;
    evaluation.value = response.evaluation!;
    super.onInit();
  }


  @override
  void onClose() {
    UserService.instance.reloadData();
    super.onClose();
  }

  Rxn<double> speakingSpeed = Rxn<double>();
  Rxn<double> speakingTime = Rxn<double>();
  Rxn<int> talkingScore = Rxn<int>();
  RxString evaluation = "채점 중입니다...".obs;
}
