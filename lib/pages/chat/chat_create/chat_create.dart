import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/chat_create_binding.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create/components/chat_create_body.dart';
import 'package:real_app_2/pages/chat/chat_create_detail/chat_create_detail.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatCreate extends GetView<ChatCreateController> {
  const ChatCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('방 만들기'),
          centerTitle: true,
          actions: [
            Obx(
              () => TextButton(
                onPressed: controller.title.value.isNotEmpty &&
                        controller.titleErrorText.value.isEmpty &&
                        controller.locationName.value.isNotEmpty &&
                        controller.content.value.isNotEmpty
                    ? () {
                        Get.to(() => const ChatCreateDetail(),
                            binding: ChatCreateBinding());
                      }
                    : null,
                child: Text(
                  '다음',
                  style: TextStyle(
                    fontSize: Get.width * 0.045,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ChatCreateBody(),
      ),
    );
  }
}
