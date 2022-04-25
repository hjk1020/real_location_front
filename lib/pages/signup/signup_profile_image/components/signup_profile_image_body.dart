import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/signup_binding.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_interesting/signup_interesting.dart';
import 'package:real_app_2/pages/signup/signup_profile_image/components/empty_profile_image.dart';
import 'package:real_app_2/pages/signup/signup_profile_image/components/profile_image.dart';
import 'package:real_app_2/theme/theme.dart';

class SignupProfileImageBody extends GetView<SignupController> {
  const SignupProfileImageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.1),
                const LoginTitle(text: '프로필 사진을 등록하세요.'),
                SizedBox(height: Get.height * 0.1),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              Navigator.pop(context);
                              await controller.cameraImage();
                            },
                            child: const Center(
                              child: Text('📷 카메라'),
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              Navigator.pop(context);
                              await controller.galleryImage();
                            },
                            child: const Center(
                              child: Text('🖼️ 갤러리'),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: GetBuilder<SignupController>(
                    init: SignupController(),
                    builder: (_) => _.profileFile == null
                        ? const EmptiedProfileImage()
                        : ProfileImage(
                            backgroundImage: _.profileFile,
                          ),
                  ),
                ),
                SizedBox(height: Get.height * 0.175),
                GetBuilder<SignupController>(
                  init: SignupController(),
                  builder: (_) => SizedBox(
                    height: Get.height * 0.065,
                    width: Get.width * 0.5,
                    child: NomalButton(
                      onPressed: _.profileFile == null
                          ? null
                          : () {
                              Get.to(() => const SignupInteresting(),
                                  binding: SignupBinding());
                            },
                      child: Text(
                        '다음',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: Get.width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
