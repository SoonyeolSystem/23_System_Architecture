import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/STT/view/stt_page.dart';
import 'package:soonyeol_architecture/pages/TTS/tts.dart';
import 'package:soonyeol_architecture/pages/dev_route/view/route_view_page.dart';
import 'package:soonyeol_architecture/pages/likeList/view/like_page.dart';
import 'package:soonyeol_architecture/pages/login/view/login_page.dart';
import 'package:soonyeol_architecture/pages/main/view/navigation.dart';
import 'package:soonyeol_architecture/pages/my_info/view/info_main_view_page.dart';
import 'package:soonyeol_architecture/pages/signup/view/sign_up_page.dart';
import 'package:soonyeol_architecture/pages/situation/view/situation_each_view_page.dart';
import 'package:soonyeol_architecture/pages/situation/view/situation_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_custom_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_result_page.dart';

// CustomRouter is used to define the routes
class CustomRouter {
  static final routes = [
    GetPage(name: RouteViewPage.url, page: () => const RouteViewPage()),
    GetPage(name: Navigation.url, page: () => const Navigation()),
    GetPage(name: TalkingViewPage.url, page: () => const TalkingViewPage()),
    GetPage(name: TalkingCustomPage.url, page: () => const TalkingCustomPage()),
    GetPage(name: TalkingResultPage.url, page: () => const TalkingResultPage()),
    GetPage(name: SituationMainPage.url, page: () => const SituationMainPage()),
    GetPage(name: LoginPage.url, page: () => const LoginPage()),
    GetPage(name: SignUpPage.url, page: () => const SignUpPage()),
    GetPage(name: MyInfoPage.url, page: () => const MyInfoPage()),
    GetPage(name: TTSPage.url, page: () => TTSPage()),
    GetPage(name: STTPage.url, page: () => const STTPage()),
    GetPage(name: LikePage.url, page: () => const LikePage()),
    GetPage(name: SituationEachPage.url, page: () => const SituationEachPage()),
  ];
}
