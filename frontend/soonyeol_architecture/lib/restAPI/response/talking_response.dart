import 'package:soonyeol_architecture/restAPI/models/Talking.dart';

class TalkingResponse {
  List<Talking> scriptHistory = [];

  TalkingResponse({required this.scriptHistory});

  TalkingResponse.fromJson(List json) {
    scriptHistory = <Talking>[];
    for (var v in json) {
      scriptHistory.add(Talking.fromJson(v));
    }
  }
}
