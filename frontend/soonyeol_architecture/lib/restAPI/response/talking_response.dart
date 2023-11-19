import 'package:soonyeol_architecture/restAPI/models/Talking.dart';

class TalkingResponse {
  List<Talking> scriptHistory = [];
  int likeCount = 0;
  bool isLike = false;

  TalkingResponse({required this.scriptHistory});

  TalkingResponse.fromJson(Map<String, dynamic> json) {
    likeCount = json['like'];
    isLike = json['islike'];
    scriptHistory = <Talking>[];
    for (var v in json['script_history']) {
      scriptHistory.add(Talking.fromJson(v));
    }
  }
}
