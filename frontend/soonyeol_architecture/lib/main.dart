import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/pages/dev_route/view/route_view_page.dart';
import 'package:soonyeol_architecture/pages/main/controller/main_view_controller.dart';
import 'package:soonyeol_architecture/pages/my_info/controller/info_view_controller.dart';
import 'package:soonyeol_architecture/pages/scenario/controller/scenario_main_controller.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/routes.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

void main() async {
  await initServices();
  initController();
  runApp(GetMaterialApp(
    initialRoute: RouteViewPage.url,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        canvasColor: Colors.transparent,
        backgroundColor: Colors.white,
        fontFamily: 'NotoSansKR',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
    getPages: CustomRouter.routes,
    themeMode: ThemeMode.light,
  ));
}

void initController() {
  Get.put(MainViewController());
  Get.put(ScenarioMainController());
  Get.put(InfoViewController());
}

Future<void> initServices() async {
  await Get.putAsync(() => Common().init());
  await Get.putAsync(() => ApiService().init());
  await Get.putAsync(() => UserService().init());
}
