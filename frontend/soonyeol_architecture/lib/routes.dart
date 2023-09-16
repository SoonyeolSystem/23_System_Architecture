import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/main/view/main_view_page.dart';

class CustomRouter {
  static final routes = [
    GetPage(name: MainViewPage.url, page: () => const MainViewPage()),
  ];
}
