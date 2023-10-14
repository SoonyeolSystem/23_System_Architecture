import 'package:get/get.dart';

class MainViewController extends GetxController {
  static MainViewController get instance => Get.find<MainViewController>();
  // final List<Widget> bodyContent = [
  //   const MainViewPage(),
  //   const ScenarioMainPage(),
  //   const MyInfoPage(),
  // ];

  RxInt bookmarkCount = 5.obs;

  // Rx<ScrollController> scrollcontroller = ScrollController().obs;
}
