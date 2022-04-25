import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/components/grey_container_text_field.dart';
import 'package:real_app_2/components/grey_content_text_field.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create/components/chat_create_location.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatCreateBody extends GetView<ChatCreateController> {
  const ChatCreateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: BlackProgressIndicator(),
              )
            : Column(
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 9,
                  //       child: Container(
                  //         height: 40.0,
                  //         child: FilterChip(
                  //           label: Text('하이'),
                  //           onSelected: (v) {},
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 1,
                  //       child: IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(Icons.menu),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  //const SizedBox(height: 20.0),
                  GreyContainerTextField(
                    controller: controller.textEditingController,
                    hint: '방 제목 입력',
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    onChanged: controller.changedTitle,
                    error: controller.titleErrorText.value,
                    suffixIcon: controller.title.value.isEmpty
                        ? null
                        : IconButton(
                            onPressed: () {
                              controller.textEditingController.clear();
                              controller.title.value = '';
                            },
                            icon: Icon(Icons.close),
                          ),
                  ),
                  const SizedBox(height: 20.0),
                  ChatCreateLocationModal(),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: Get.height * 0.2,
                    child: GreyContentTextField(
                      onChanged: (v) {
                        controller.content.value = v;
                        print(controller.locationName.value);
                        print(controller.content.value);
                      },
                      hint: '방 내용 입력',
                    ),
                  )
                ],
              ),
      ),
    ));
  }
}
