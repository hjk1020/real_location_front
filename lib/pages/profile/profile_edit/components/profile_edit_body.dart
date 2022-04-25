import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/profile_edit_binding.dart';
import 'package:real_app_2/components/linear_textfield.dart';
import 'package:real_app_2/controllers/profile_edit_controller.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit_detail/profile_edit_detail.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit_intro/profile_edit_intro.dart';
import 'package:real_app_2/theme/theme.dart';

class ProfileEditBody extends GetView<ProfileEditController> {
  const ProfileEditBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: Get.height * 0.1,
                        width: Get.height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: AppColor.light_grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: Get.height * 0.25,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '프로필 사진',
                                            style: TextStyle(
                                                fontSize: Get.width * 0.05),
                                          ),
                                        ),
                                      ),
                                      const Divider(color: AppColor.light_grey),
                                      ImageBottomSheetContainer(
                                        onTap: () {
                                          print(2);
                                        },
                                        text: '새 프로필 사진 추가',
                                      ),
                                      const Divider(
                                          color: AppColor.extra_light_grey),
                                      ImageBottomSheetContainer(
                                        onTap: () {
                                          print('1');
                                        },
                                        text: '사진집 변경',
                                      ),
                                      const Spacer(flex: 1)
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Container(
                          height: Get.height * 0.03,
                          width: Get.height * 0.03,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.white,
                            border: Border.all(
                              color: AppColor.light_grey,
                            ),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.pen,
                              size: Get.height * 0.017,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.05),
                  LinearTextField(
                    labelText: '이름',
                    initialValue: controller.name.value,
                    onChanged: controller.changedName,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: LinearTextField(
                      labelText: '사용자이름',
                      initialValue: controller.username.value,
                      onChanged: controller.changedUsername,
                    ),
                  ),
                  LinearTextField(
                    labelText: '웹 사이트',
                    initialValue: controller.website.value,
                    onChanged: controller.changedWebsite,
                    error: controller.websiteErrorText.value.isEmpty
                        ? null
                        : controller.websiteErrorText.value,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Stack(
                      children: [
                        LinearTextField(
                          labelText: '소개',
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ProfileEditIntro(),
                                binding: ProfileEditBinding());
                          },
                          child: Container(
                              height: Get.height * 0.07,
                              color: Colors.transparent),
                        ),
                      ],
                    ),
                  ),
                  BottomTextButton(
                    onPressed: () {},
                    text: '선호도 변경',
                  ),
                  Divider(color: AppColor.light_grey),
                  BottomTextButton(
                    onPressed: () {
                      Get.to(() => ProfileEditDetail(),
                          binding: ProfileEditBinding());
                    },
                    text: '상세 프로필 변경',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class BottomTextButton extends StatelessWidget {
  final onPressed;
  final text;
  const BottomTextButton({
    Key? key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: Get.width * 0.04),
        ),
      ),
    );
  }
}

class ImageBottomSheetContainer extends StatelessWidget {
  final text;
  final onTap;

  const ImageBottomSheetContainer({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              fontSize: Get.width * 0.05,
              color: Colors.black,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
