import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:soonyeol_architecture/common/common.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/component/talking_viewpage_component.dart';

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
              //image: AssetImage('assets/images/talking.jpg'),
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
                    Text(
                      '${controller.parameters['title']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 30), // Add some spacing between text and icon
                    InkWell(
                      onTap: () {
                        // Use Builder to get the context of the current Scaffold
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Create and return your info dialog here
                            return AlertDialog(
                              content: Text("상황\n ${controller.parameters['title']}"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.info_outline_rounded, color: Colors.white, size: 18),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),

              Obx(() => Text(controller.speechText.value, style: const TextStyle(fontSize: 20, color: Colors.white))),
              Expanded(
                  child: CustomScrollView(
                controller: controller.scrollcontroller.value,
                physics: const BouncingScrollPhysics(),
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

              //floatingActionButton: FloatingActionButton(onPressed: () {}),
              //const SizedBox(
              //  height: 80,
              //child: Icon(Icons.mic, size: 40, color: Colors.white)),
              // Material(
              //    child: InkWell(
              //     customBorder: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //       ),
              //     highlightColor: Colors.white.withOpacity(0.5),
              //     child: const Padding(
              //       padding: EdgeInsets.all(13.0),
              //       child: SizedBox(
              //         height: 43,
              //         width: 35,
              //         child: FittedBox(
              //           fit: BoxFit.fill,
              //           child: Icon(
              //             Icons.mic,
              //             size: 40,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //     onTap: () {print("mic");},

              //   ),
              // ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //controller.sendMesage();
          controller.listen();
        },
        backgroundColor: Colors.transparent,
        child: Obx(
          () => SizedBox(
            height: 42,
            width: 35,
            child: controller.isLoaded.value
                ? const SizedBox(
                    height: 35,
                    width: 35,
                    child: CircularProgressIndicator(
                      color: Colors.white,
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
