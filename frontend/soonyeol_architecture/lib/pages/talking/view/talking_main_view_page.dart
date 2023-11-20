import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/pages/login/view/login_page.dart';
import 'package:soonyeol_architecture/pages/main/view/navigation.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/component/talking_viewpage_component.dart';
import 'package:soonyeol_architecture/pages/talking/view/talking_result_page.dart';
import 'package:soonyeol_architecture/restAPI/api_service.dart';
import 'package:soonyeol_architecture/service/user_service.dart';

class TalkingViewPage extends StatelessWidget {
  const TalkingViewPage({
    super.key,
  });

  static const String url = '/talking';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TalkingViewController());

    if (Get.arguments != null) {
      controller.passParameter(Get.arguments);
    }
    final List<Color> colors = [
      const Color.fromARGB(255, 240, 135, 135),
      const Color.fromARGB(255, 136, 241, 143),
      const Color.fromARGB(255, 136, 180, 245),
      const Color.fromARGB(255, 121, 121, 121)
    ];

    final List<int> duration = [900, 700, 600, 800, 500];
    return Scaffold(
      body: Center(
        child: Container(
          width: Common.getWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/talking2.jpg'),
            ),
          ),
          child: Column(
            children: [
              AppBar(
                elevation: 0.0,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 377,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${controller.parameters['title']}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                          ),

                          const SizedBox(width: 25), // Add some spacing between text and icon
                          InkWell(
                            onTap: () {
                              showInformation(context);
                            },
                            child: const Icon(Icons.info_outline_rounded, color: Colors.white, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {
                    showCustomAlertDialog(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),

              //Obx(() => Text(controller.speechText.value, style: const TextStyle(fontSize: 20, color: Colors.white))),
              Expanded(
                  child: CustomScrollView(
                controller: controller.scrollcontroller.value,
                slivers: [
                  Obx(
                    () => SliverList(
                        delegate: SliverChildBuilderDelegate(
                      ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              if (index == 0) const SizedBox(height: 20),
                              TalkingViewComponent(model: controller.talkingList.value[index]),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 15),
                              ),
                              if (index == controller.talkingList.length - 1)
                                const SizedBox(
                                  height: 20,
                                )
                            ],
                          ),
                        );
                      }),
                      childCount: controller.talkingList.length,
                    )),
                  )
                ],
              )),

              Obx(() => controller.isListening.value
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: MusicVisualizer(
                        barCount: 30,
                        colors: colors,
                        duration: duration,
                      ),
                    )
                  : const SizedBox())
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.parameters.value['situationid'] == "" || controller.parameters.value['end_story'] == 'true'
            ? const SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  //controller.sendMesage();
                  controller.listen();
                },
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  height: 42,
                  width: 42,
                  child: controller.isLoaded.value
                      ? Transform.scale(
                          scale: 0.9,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 5,
                          ),
                        )
                      : const FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(
                            Icons.mic,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void showCustomAlertDialog(BuildContext context) {
  final controller = Get.find<TalkingViewController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(20), // 알림창의 내용(padding) 크기 조절
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // 알림창의 모서리(rounded corners) 조절
        ),

        content: SizedBox(
          width: 290,
          height: 160,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.grey,
                    iconSize: 22,
                    onPressed: () {
                      Get.back(); // 알림창을 닫습니다.
                    },
                  ),
                ],
              ),
              Text(
                controller.parameters.value['situationid'] == "" ? '대화를 그만보겠습니까?\n' : '대화를 그만두시겠습니까?\n',
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 26,
              ),
              Obx(
                () => controller.waitingToResult.value
                    ? const CircularProgressIndicator(color: Color(0xFF33C26C))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (controller.parameters.value['situationid'] != "" && controller.parameters.value['end_story'] == 'false')
                            TextButton(
                              onPressed: () async {
                                controller.waitingToResult.value = true;
                                final response = await ApiService.instance.evaluateConversation(controller.parameters.value['conversationid']);
                                if (response.result) {
                                  Get.offAllNamed(TalkingResultPage.url, arguments: response.value);
                                } else {
                                  Get.snackbar("에러", "에러가 발생했습니다.");
                                  controller.waitingToResult.value = false;
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF33C26C)),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                                ),
                              ),
                              child: const Text('대화 결과 보기', style: TextStyle(color: Colors.white, fontSize: 14)),
                            ),
                          TextButton(
                            onPressed: () {
                              UserService.instance.reloadData();
                              Get.offAllNamed(Navigation.url);
                              // 홈으로 돌아가기 동작 수행
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(color: Color(0xFF33C26C), width: 2.0),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                              ),
                            ),
                            child: const Text(
                              '홈으로 돌아가기',
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      );
    },
  );
}

void showInformation(BuildContext context) {
  final controller = TalkingViewController.instance;
  Get.dialog(AlertDialog(
    contentPadding: const EdgeInsets.all(20), // 알림창의 내용(padding) 크기 조절
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0), // 알림창의 모서리(rounded corners) 조절
    ),
    backgroundColor: const Color.fromARGB(232, 255, 255, 255),
    alignment: Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.09),
    content: SizedBox(
      width: 307,
      //height: ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            SizedBox(
              width: 257,
              child: Text(
                "${controller.parameters['title']}",
                style: const TextStyle(fontSize: 21, color: Color(0xFF384252), fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Obx(() => IconButton(
                  onPressed: () {
                    print(controller.conversation.value.isLike);
                    if (UserService.instance.isLogin() == false) {
                      Get.toNamed(LoginPage.url);
                      return;
                    }
                    if (controller.conversation.value.isLike ?? false == true) {
                      controller.unlikeConversation(controller.parameters['conversationid'], UserService.instance.userId);
                    } else {
                      controller.likeConversation(controller.parameters['conversationid'], UserService.instance.userId);
                    }
                  },
                  icon: controller.conversation.value.isLike ?? false == true ? const Icon(CupertinoIcons.heart_fill) : const Icon(CupertinoIcons.heart),
                  iconSize: 33,
                  color: controller.conversation.value.isLike ?? false == true ? const Color.fromARGB(255, 243, 106, 106) : const Color(0xFF384252),
                )),
          ]),
          const SizedBox(
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 97,
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Color(0xFF384252), width: 3)),
                  ),
                  child: const Text(
                    '  상황',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF384252),
                    ),
                  )),
              SizedBox(
                width: 210,
                child: Text(
                  "${controller.parameters['situation']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF373737),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 31,
          ),
          Row(
            children: [
              Container(
                  width: 97,
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Color(0xFF384252), width: 3)),
                  ),
                  child: const Text(
                    '  장르',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF384252),
                    ),
                  )),
              SizedBox(
                width: 210,
                child: Text(
                  "${controller.parameters['genre']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF373737),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 31,
          ),
          Row(
            children: [
              Container(
                  width: 97,
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Color(0xFF384252), width: 3)),
                  ),
                  child: const Text(
                    '  주인공',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF384252),
                    ),
                  )),
              SizedBox(
                width: 210,
                child: Text(
                  "${controller.parameters['name']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF373737),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 31,
          ),
          Row(
            children: [
              Container(
                  width: 97,
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Color(0xFF384252), width: 3)),
                  ),
                  child: const Text(
                    '  대화 상대',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF384252),
                    ),
                  )),
              SizedBox(
                width: 210,
                child: Text(
                  "${controller.parameters['character']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF373737),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ));
}
