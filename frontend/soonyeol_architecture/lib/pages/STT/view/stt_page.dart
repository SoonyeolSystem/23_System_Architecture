import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_visualizer/music_visualizer.dart';
import 'package:soonyeol_architecture/pages/STT/controller/stt_view_controller.dart';

class STTPage extends StatelessWidget {
  const STTPage({super.key});

  static const String url = '/stt';

  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(STTViewController());
    
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Obx(() => Text(
                  controller.speechText.value,
                  style:  TextStyle(fontSize:20))),
                
              ],
            ),
          ),
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          ()=> AvatarGlow(
            animate: controller.isListening.value,
            glowColor: Colors.blue,
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            repeatPauseDuration: Duration(milliseconds: 2000),
            child: FloatingActionButton(
              child: Icon(
                controller.isListening.value?Icons.mic : Icons.mic_none,
                color: Colors.white,
              ),
              onPressed: (){controller.listen();},
            ),
          )
        ),
      );
  }
}
