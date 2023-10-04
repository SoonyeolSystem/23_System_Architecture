import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';
import 'package:soonyeol_architecture/restAPI/response/get_scenario_list_response.dart';
import 'package:soonyeol_architecture/restAPI/response/get_scenario_response.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import '../../../restAPI/models/Scenario.dart';

class ScenarioMainController extends GetxController {
  RxList<Scenario> scenarioList = RxList<Scenario>();
  Rx<Scenario> scenario = Scenario().obs;
  RxList<bool> onTapList = List.filled(4, false).obs;

  static ScenarioMainController get instance =>
      Get.find<ScenarioMainController>();

  Rx<ScrollController> scrollcontroller = ScrollController().obs;

  @override
  void onInit() async {
    super.onInit();
    await getScenarioList();
  }

  Future<void> getScenarioList() async {
    // ApiResponse<ScenarioListResponse> response =
    //     await ApiService.instance.getScenarioList();
    // if (response.result) {
    //   scenarioList.value = response.value!.scenarioList!;
    //   scenarioList.value = scenarioList.value.toList();
    // }
    // scenarioList.refresh();
  }
}
