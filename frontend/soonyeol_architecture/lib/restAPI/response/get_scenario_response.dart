import 'package:soonyeol_architecture/restAPI/models/Scenario.dart';

class ScenarioResponse {
  Scenario? scenario;

  ScenarioResponse({this.scenario});

  ScenarioResponse.fromJson(Map<String, dynamic> json) {
    scenario = Scenario.fromJson(json);
  }
}
