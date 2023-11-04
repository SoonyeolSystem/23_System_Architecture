import 'package:soonyeol_architecture/restAPI/models/Situation.dart';

class SituationResponse {
  Situation? situation;

  SituationResponse({this.situation});

  SituationResponse.fromJson(Map<String, dynamic> json) {
    situation = Situation.fromJson(json);
  }
}
