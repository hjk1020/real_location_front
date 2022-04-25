import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create_detail/components/chat_create_detail_body.dart';

class ChatCreateDetail extends GetView<ChatCreateController> {
  const ChatCreateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('방 만들기(세부)'),
          centerTitle: true,
          actions: [
            Obx(() => TextButton(
                  onPressed: () {
                    controller.roomCreateHttp();
                  },
                  child: controller.isLoading.value
                      ? BlackProgressIndicator()
                      : Text(
                          '완료',
                          style: TextStyle(
                            fontSize: Get.width * 0.045,
                          ),
                        ),
                ))
          ],
        ),
        body: ChatCreateDetailBody(),
      ),
    );
  }
}
