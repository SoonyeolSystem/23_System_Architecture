// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:soonyeol_architecture/pages/signup/view/sign_up_page.dart';
// import 'package:aws_polly/aws_polly.dart';
// import '../../../../common/common.dart';

// class TTSPage extends StatefulWidget {
//   TTSPage({Key? key}) : super(key: key);

//   @override
//   _TTSPageState createState() => _TTSPageState();
// }

// class _TTSPageState extends State<TTSPage> {
//   static const String url = '/tts';
//   String? urlPolly;

//   final TextEditingController textEditingController = TextEditingController(text: 'Hello world');
//   final AwsPolly _awsPolly = AwsPolly.instance(
//     poolId: 'us-east-1:xxxx-xxx-xxxxx',
//     region: AWSRegionType.USEast1,
//   );

//   @override
//   void initState() {
//     super.initState();
//     _initializePolly();
//   }

//   _initializePolly() async {
//     urlPolly = await _awsPolly.getUrl(
//       voiceId: AWSPolyVoiceId.nicole,
//       input: 'This is a sample text playing through Poly!',
//     );
//     setState(() {});
//   }


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       debugShowCheckedModeBanner: false,
//       home: Center(
//         child: Container(
//           width: Common.getWidth,
//           color: Colors.white,
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Material(
//                 type: MaterialType.transparency,
//                 child: Container(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 40.0, top: 50.0),
//                     child: Text(
//                       'TTS',
//                       style: TextStyle(fontSize: 30, color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//               Material(
//                 type: MaterialType.transparency,
//                 child: Container(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 45.0, top: 40.0),
//                     child: Text(
//                       '텍스트',
//                       style: TextStyle(fontSize: 22, color: Color(0xFF888888)),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Material(
//   child: Container(
//     width: Common.getWidth - 80,
//     height: 200,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5),
//       color: Color(0xFFF3F8F5),
//     ),
//     child: TextFormField(
//       keyboardType: TextInputType.text,
//       maxLines: null, // 여러 줄 입력을 허용합니다.
//       style: TextStyle(
//         fontSize: 20,
//         color: Colors.black,
//       ),
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.only(left: 20, top: 10),
//       ),
//     ),
//   ),
// ),

             
             
//               SizedBox(height: 70),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: ElevatedButton(
//                   onPressed: () {
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//                     backgroundColor: Color(0xFF33C26C),
//                     minimumSize: Size(420, 60),
//                   ),
//                   child: Text(
//                     'Speak',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSPage extends StatelessWidget {
  final FlutterTts tts = FlutterTts();
  final TextEditingController con = TextEditingController();

  static const String url = '/tts';

  TTSPage({Key? key}) : super(key: key) {
    tts.setLanguage("ko-KR");
    tts.setSpeechRate(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Title"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: con,
            ),
            TextButton(
              onPressed: () => tts.speak(con.text),
              child: Text("재생버튼"),
            )
          ],
        ),
      ),
    );
  }
}
