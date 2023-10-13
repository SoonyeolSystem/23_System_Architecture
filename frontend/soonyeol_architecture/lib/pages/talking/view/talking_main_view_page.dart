import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';
import 'package:soonyeol_architecture/pages/talking/view/component/talking_viewpage_component.dart';

class TalkingViewPage extends StatelessWidget {
  const TalkingViewPage({super.key});

  static const String url = '/talking';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TalkingViewController());
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromARGB(255, 1, 56, 8),
                Color(0xFF000118),
                Color.fromARGB(255, 33, 7, 1)
              ])),
          child: Column(
            children: [
              AppBar(
                elevation: 0.0,
                centerTitle: true,
                title: const Text(
                  '사막에서 살아남기',
                  style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    size:30,
                    color: Colors.grey,
                  ),
                ),
              ),
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
                              TalkingViewComponent(
                                  model: controller.talkingList.value[index]),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10, top: 15),
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
              //const SizedBox(
              //  height: 80,
              //child: Icon(Icons.mic, size: 40, color: Colors.white)),
              Material(
                 child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    ),
                  highlightColor: Colors.white.withOpacity(0.5),
                  child: const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: SizedBox(
                      height: 43,
                      width: 35,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(
                          Icons.mic,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {print("mic");},
                  
                ),
              ),
            ],
          )),
    );
  }
}
