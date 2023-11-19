import 'package:soonyeol_architecture/restAPI/models/Talking.dart';

class TalkingResponse {
  List<Talking> scriptHistory = [];

  TalkingResponse({required this.scriptHistory});

  TalkingResponse.fromJson(Map<String, dynamic> json) {
    scriptHistory = <Talking>[];
    for (var v in json['script_history']) {
      scriptHistory.add(Talking.fromJson(v));
    }
  }
}
