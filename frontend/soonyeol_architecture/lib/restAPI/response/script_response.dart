import 'package:soonyeol_architecture/restAPI/models/Talking.dart';

class ScriptResponse {
  String? message;
  String? statusCode;
  List<Talking>? scriptHistory;

  ScriptResponse({this.message, this.statusCode});

  ScriptResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['script_history'] != null) {
      scriptHistory = <Talking>[];
      json['script_history'].forEach((v) {
        scriptHistory!.add(Talking.fromJson(v));
      });
    }
  }
}
