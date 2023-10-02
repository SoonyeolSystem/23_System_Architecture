// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

// import '../../../common/common.dart';

// class TalkingCustomPage extends StatelessWidget {
//   const TalkingCustomPage({super.key});

//   static const String url = '/talking/custom';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           // 중앙 정렬
//           child: Container(
//             width: Common.getWidth, // 가로 길이 설정
//             color: Colors.black.withOpacity(0.9),
//             child: Column(
//               // 세로 중앙 정렬
//               crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
//               children: [
//                 Material(
//                   type: MaterialType.transparency,
//                   child: Container(
//                     //alignment: Alignment.topCenter,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 50.0),
//                       child: Text(
//                         '시나리오 커스텀',
//                         style: TextStyle(fontSize: 30, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Container(
//                   width: Common.getWidth - 100,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color(0xFF434343),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment:
//                           CrossAxisAlignment.start, // 컨텐츠 가운데 정렬
//                       children: [
//                         Text(
//                           '상황',
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                         SizedBox(height: 10),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           cursorColor: Colors.white,
//                           maxLines: null,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           '주인공',
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                         SizedBox(height: 10),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           cursorColor: Colors.white,
//                           maxLines: null,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           '등장인물',
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                         SizedBox(height: 10),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                             ),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                           cursorColor: Colors.white,
//                           maxLines: null,
//                         ),
//                         SizedBox(height: 30),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 80),
//                 SizedBox(
//                   width: Common.getWidth - 100,
//                   height: 60,
//                   child: ElevatedButton(
//                     child: Text(
//                       '시작하기',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       primary: Color(0xFF47CDD6),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:soonyeol_architecture/pages/talking/controller/talking_view_controller.dart';

import '../../../common/common.dart';

class TalkingCustomPage extends StatelessWidget {
  const TalkingCustomPage({super.key});

  static const String url = '/talking/custom';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Expanded(
              // 중앙 정렬
              child: Container(
                width: Common.getWidth, // 가로 길이 설정
                color: Colors.black.withOpacity(0.9),
                child: Column(
                  // 세로 중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Container(
                        //alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Text(
                            '시나리오 커스텀',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: Common.getWidth - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF434343),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // 컨텐츠 가운데 정렬
                          children: [
                            Text(
                              '상황',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              maxLines: null,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '주인공',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              maxLines: null,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '등장인물',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              maxLines: null,
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    SizedBox(
                      width: Common.getWidth - 100,
                      height: 60,
                      child: ElevatedButton(
                        child: Text(
                          '시작하기',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF47CDD6),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
