import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';

class ConversationListResponse {
  List<Conversation>? conversationList;

  ConversationListResponse({this.conversationList});

  ConversationListResponse.fromJson(List<dynamic> jsonList) {
    conversationList = <Conversation>[];
    if (jsonList.isNotEmpty) {
      for (var v in jsonList) {
        conversationList!.add(Conversation.fromJson(v));
      }
    }
  }
}
