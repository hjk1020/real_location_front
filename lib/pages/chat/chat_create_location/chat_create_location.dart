import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create_location/components/chat_create_location_body.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatCreateLocation extends StatelessWidget {
  const ChatCreateLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오프라인 위치 검색'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('완료'),
          ),
        ],
      ),
      body: ChatCreateLocationBody()
      // SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(children: [
      //       SizedBox(height: Get.height * 0.1),
      //       Container(
      //         height: Get.height * 0.1,
      //         decoration: BoxDecoration(
      //           border: Border.symmetric(
      //             horizontal: BorderSide(
      //               color: AppColor.extra_extra_light_grey,
      //             ),
      //           ),
      //         ),
      //         child: Row(children: []),
      //       ),
      //     ]),
      //   ),
      // ),
    );
  }
}
