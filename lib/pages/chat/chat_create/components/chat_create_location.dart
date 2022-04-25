import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/chat_create_binding.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create_location/chat_create_location.dart';
import 'package:real_app_2/pages/chat/chat_create_location/chat_create_location_dong/chat_create_location_dong.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatCreateLocationModal extends GetView<ChatCreateController> {
  const ChatCreateLocationModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        Get.to(() => const ChatCreateLocationDong(),
                            binding: ChatCreateBinding());
                      },
                      child: const Center(
                        child: Text('☕ 오프라인'),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.locationName.value = '온라인';
                      },
                      child: const Center(
                        child: Text('💻 온라인'),
                      ),
                    )
                  ],
                ));
      },
      child: Row(
        children: [
          const Expanded(flex: 1, child: Icon(Icons.add_location_alt_outlined)),
          const Spacer(flex: 1),
          Expanded(
            flex: 9,
            child: Container(
              height: Get.height * 0.055,
              decoration: BoxDecoration(
                color: AppColor.extra_extra_light_grey,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Obx(() => Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: controller.locationName.value.isEmpty
                          ? Text(
                              '주소 입력',
                              style: TextStyle(
                                color: AppColor.light_grey,
                                fontSize: Get.width * 0.045,
                              ),
                            )
                          : Text(
                              controller.locationName.value,
                              style: TextStyle(fontSize: Get.width * 0.045),
                            ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
