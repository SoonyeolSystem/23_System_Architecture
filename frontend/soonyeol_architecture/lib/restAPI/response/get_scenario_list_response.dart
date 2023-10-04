import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

class ScenarioListResponse {
  List<Scenario>? scenarioList;

  ScenarioListResponse({this.scenarioList});

  ScenarioListResponse.fromJson(List<dynamic> jsonList) {
    scenarioList = <Scenario>[];
    if (jsonList.isNotEmpty) {
      for (var v in jsonList) {
        scenarioList!.add(Scenario.fromJson(v));
      }
    }
  }
}
