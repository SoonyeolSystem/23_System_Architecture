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
  static ScenarioMainController get instance =>
      Get.find<ScenarioMainController>();

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

    List<Map<String, dynamic>> fakeJsonData = [
      {
        "scenarioname": "사막에서 살아남기",
        "bookmarkcount": 32,
        "view": 123,
        "isLisbookmarkiked": true,
        "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
        "genre": ["재난", "생존"],
        "character": ["생존자1", "생존자2"],
        "maincharacter": "생존자1"
      },
      {
        "scenarioname": "사막에서 살아남기2",
        "bookmarkcount": 31,
        "view": 10,
        "isLisbookmarkiked": false,
        "situation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
        "genre": ["재난", "생존"],
        "character": ["생존자3", "생존자4"],
        "maincharacter": "생존자3"
      },
    ];
    List<Scenario> fakeScenarios =
        fakeJsonData.map((jsonData) => Scenario.fromJson(jsonData)).toList();
    scenarioList.value = fakeScenarios;
    scenarioList.refresh();
  }

  RxList<Scenario> scenarioList = <Scenario>[].obs;
  Rx<Scenario> scenario = Scenario().obs;
  RxList<bool> onTapList = List.filled(4, false).obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
