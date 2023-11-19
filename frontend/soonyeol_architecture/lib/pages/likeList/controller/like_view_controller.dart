import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_list_response.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class LikeViewController extends GetxController {
  static LikeViewController get instance => Get.find<LikeViewController>();

  @override
  void onInit() async {
    super.onInit();
    await getLikeSituationlist();
  }

  Future<void> getLikeSituationlist() async {
    ApiResponse<SituationListResponse> response = await ApiService.instance.getLikeSituationlist(UserService.instance.userId);
    if (response.result) {
      situationlikeList.value = response.value!.situationList!;
    }
    situationlikeList.refresh();
  }

  RxList<Situation> situationlikeList = <Situation>[].obs;
}
