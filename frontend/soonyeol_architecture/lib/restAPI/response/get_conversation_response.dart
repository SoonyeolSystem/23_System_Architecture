import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';

class ConversationResponse {
  Conversation? conversation;

  ConversationResponse({this.conversation});

  ConversationResponse.fromJson(Map<String, dynamic> json) {
    conversation = Conversation.fromJson(json);
  }
}
