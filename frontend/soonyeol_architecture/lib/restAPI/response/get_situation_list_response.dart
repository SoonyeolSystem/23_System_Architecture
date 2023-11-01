import 'package:soonyeol_architecture/restAPI/models/Situation.dart';

class SituationListResponse {
  List<Situation>? situationList;

  SituationListResponse({this.situationList});

  SituationListResponse.fromJson(List<dynamic> jsonList) {
    situationList = <Situation>[];
    if (jsonList.isNotEmpty) {
      for (var v in jsonList) {
        situationList!.add(Situation.fromJson(v));
      }
    }
  }
}
