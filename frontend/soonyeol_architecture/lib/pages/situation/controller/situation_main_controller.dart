import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/service_response.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';
import 'package:soonyeol_architecture/restAPI/response/get_situation_list_response.dart';

class SituationMainController extends GetxController {
  static SituationMainController get instance =>
      Get.find<SituationMainController>();

  Future<void> postBookmarkSituation() async {
    situation.value.isbookmark = !situation.value.isbookmark!;
    situation.refresh();
  }

  Future<void> getSituationList() async {
    ApiResponse<SituationListResponse> response =
        await ApiService.instance.getSituationList();
    if (response.result) {
      situationList.value = response.value!.situationList!;
    }
    situationList.refresh();

    // List<Map<String, dynamic>> fakeJsonData = [
    //   {
    //     "scenarioname": "비행기 난파 후 아무도 없는 사막에서 살아남기",
    //     "bookmarkcount": 32,
    //     "views": 123,
    //     "isbookmark": true,
    //     "stiuation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": ["재난", "생존"],
    //     "character": ["생존자1", "생존자2"],
    //     "maincharacter": "생존자1"
    //   },
    //   {
    //     "scenarioname": "무지막지하게 추운 겨울날 스타벅스 들어가서 얼죽아 자랑하며 주문하기",
    //     "bookmarkcount": 31,
    //     "views": 10,
    //     "isbookmark": false,
    //     "stiuation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": ["재난", "생존"],
    //     "character": ["생존자3", "생존자4"],
    //     "maincharacter": "생존자3"
    //   },
    //   {
    //     "scenarioname": "사막에서 살아남기3",
    //     "bookmarkcount": 32,
    //     "views": 123,
    //     "isbookmark": true,
    //     "stiuation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": ["재난", "생존"],
    //     "character": ["생존자1", "생존자2"],
    //     "maincharacter": "생존자1"
    //   },
    //   {
    //     "scenarioname": "사막에서 살아남기4",
    //     "bookmarkcount": 32,
    //     "views": 123,
    //     "isbookmark": true,
    //     "stiuation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": ["재난", "생존"],
    //     "character": ["생존자1", "생존자2"],
    //     "maincharacter": "생존자1"
    //   },
    //   {
    //     "scenarioname": "사막에서 살아남기",
    //     "bookmarkcount": 32,
    //     "views": 123,
    //     "isbookmark": true,
    //     "stiuation": "난파된 비행기에서 살아남아 사막에서 정신을 차렸다.",
    //     "genre": ["재난", "생존"],
    //     "character": ["생존자1", "생존자2"],
    //     "maincharacter": "생존자1"
    //   },
    // ];
    // List<Situation> fakeSituations = fakeJsonData.map((jsonData) => Situation.fromJson(jsonData)).toList();
    // situationList.value = fakeSituations;
    // situationList.refresh();
  }

  RxList<Situation> situationList = <Situation>[].obs;
  Rx<Situation> situation = Situation().obs;
  RxList<bool> onTapList = List.filled(4, false).obs;

  Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
