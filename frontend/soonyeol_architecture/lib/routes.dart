import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/dev_route/view/route_view_page.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_main_view_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/component/talking_result_page.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_custom_page.dart';

// CustomRouter is used to define the routes
class CustomRouter {
  static final routes = [
    GetPage(name: RouteViewPage.url, page: () => const RouteViewPage()),
    GetPage(name: MainViewPage.url, page: () => const MainViewPage()),
    GetPage(name: TalkingViewPage.url, page: () => const TalkingViewPage()),
    GetPage(name: TalkingCustomPage.url, page: () => const TalkingCustomPage()),
    GetPage(name: TalkingResultPage.url, page: () => const TalkingResultPage()),
  ];
}