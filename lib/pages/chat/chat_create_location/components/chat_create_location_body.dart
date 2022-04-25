import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/chat_create_binding.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create_location/chat_create_location_dong/chat_create_location_dong.dart';
import 'package:real_app_2/theme/theme.dart';

class ChatCreateLocationBody extends GetView<ChatCreateController> {
  const ChatCreateLocationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(
      () => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.05),
              Text(
                '현재 위치 : ${controller.locationSample.value.sampleLocationName}',
                maxLines: 2,
                style: TextStyle(
                    fontSize: Get.width * 0.04, color: AppColor.light_grey),
              ),
              SizedBox(height: Get.height * 0.05),
              _OfflineSearch(
                onTap: () {
                  Get.to(() => const ChatCreateLocationDong(),
                      binding: ChatCreateBinding());
                },
                text: '행정동단위 입력',
                icon: Icon(
                  Icons.house_outlined,
                  size: Get.width * 0.15,
                  color: AppColor.dark_grey,
                ),
              ),
              Divider(
                color: AppColor.dark_grey,
              ),
              _OfflineSearch(
                onTap: () {},
                text: '상세주소 입력\nex)카페, 음식점 등등',
                icon: Icon(
                  Icons.local_cafe_outlined,
                  size: Get.width * 0.15,
                  color: AppColor.dark_grey,
                ),
              )
            ]),
      ),
    ));
  }
}

class _OfflineSearch extends StatelessWidget {
  final onTap;
  final text;
  final icon;

  const _OfflineSearch({
    Key? key,
    this.onTap,
    this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: Get.height * 0.15,
        child: Row(
          children: [
            Expanded(flex: 2, child: icon
                // Icon(
                //   Icons.house_outlined,
                //   size: Get.width * 0.15,
                //   color: AppColor.dark_grey,
                // ),
                ),
            Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 8,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: Get.width * 0.05,
                      fontWeight: FontWeight.w500,
                      color: AppColor.dark_grey),
                )),
            Expanded(
              flex: 2,
              child: Icon(
                Icons.search,
                size: Get.width * 0.08,
                color: AppColor.dark_grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
