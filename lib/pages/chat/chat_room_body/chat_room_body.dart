import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/pages/chat/chat_room_body/components/chat_room_body_body.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatRoomBody extends StatelessWidget {
  const ChatRoomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('같이 조깅하실 분 ~~~~~'),
            leading: Icon(Icons.arrow_back_ios),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(Icons.settings_outlined),
              )
            ],
          ),
          body: ChatRoomBodyBody(),
          bottomSheet: SizedBox(
            height: Get.height * 0.05,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(children: [
                Expanded(flex: 1, child: Icon(Icons.add_box_outlined)),
                Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColor.extra_light_grey),
                    )),
                Expanded(flex: 1, child: Icon(Icons.send_sharp))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
