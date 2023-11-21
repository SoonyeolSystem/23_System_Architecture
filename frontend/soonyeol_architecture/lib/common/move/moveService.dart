import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/restAPI/models/Conversation.dart';
import 'package:soonyeol_architecture/restAPI/models/Situation.dart';
import 'package:uuid/uuid.dart';

class MoveService extends GetxService {
  static MoveService get instance => Get.find<MoveService>();

  Future<MoveService> init() async {
    Common.logger.d('$runtimeType init!');
    return this;
  }

  void moveTalkingPageBySituation(Situation model) {
    Map<String, String> arguments = {
      'situationid': model.situationId ?? "",
      'conversationid': const Uuid().v4(),
      'situation': model.situation ?? "",
      'genre': model.genre ?? "",
      'name': model.name ?? "",
      'character': model.character ?? "",
      'title': model.title ?? "",
      'end_story': 'false',
      'new': 'false'
    };

    Get.toNamed(TalkingViewPage.url, arguments: arguments);
  }

  void moveTalkingPageByConversation(Conversation model, bool play) {
    Map<String, String> arguments = {
      'situationid': play ? model.situationID ?? "" : "",
      'conversationid': model.conversationID ?? "",
      'situation': model.situation ?? "",
      'genre': (model.genre ?? []).join(','),
      'name': model.maincharacter ?? "",
      'character': (model.character ?? []).join(','),
      'title': model.situationname ?? "",
      'end_story': (model.endStory ?? true) == true ? "true" : "false",
      'new': 'false'
    };

    print(arguments);
    Get.toNamed(TalkingViewPage.url, arguments: arguments);
  }

  void moveTalkingPageByNew({
    required String situation,
    required String genre,
    required String name,
    required String character,
    required String title,
  }) {
    Map<String, String> arguments = {
      'new': 'true',
      'situationid': const Uuid().v4(),
      'conversationid': const Uuid().v4(),
      'situation': situation,
      'genre': genre,
      'name': name,
      'character': character,
      'title': title,
      'end_story': 'false',
    };
    Get.toNamed(TalkingViewPage.url, arguments: arguments);
  }
}
