import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/signup_binding.dart';
import 'package:real_app_2/components/border_textfiled.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_username/signup_username.dart';
import 'package:real_app_2/theme/theme.dart';

class SignupNameBody extends GetView<SignupController> {
  const SignupNameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    const LoginTitle(text: '이름을 입력하세요.'),
                    SizedBox(height: Get.height * 0.13),
                    BorderTextField(
                      controller: controller.nameTextEditingController,
                      suffixIcon: controller.name.value.isEmpty
                          ? null
                          : IconButton(
                              onPressed: controller.clearName,
                              color: AppColor.primary,
                              focusColor: AppColor.primary,
                              icon: Icon(Icons.close),
                            ),
                      onChanged: controller.nameChanged,
                      errorText: controller.nameErrorText.value.isEmpty
                          ? null
                          : controller.nameErrorText.value,
                    ),
                    SizedBox(height: Get.height * 0.08),
                    Text(
                      '\u{2B50} 2-10자 사이 한글, 영대소문자, _, 숫자만 입력 가능합니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.dark_grey,
                        fontSize: Get.width * 0.028,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.23),
                    SizedBox(
                      height: Get.height * 0.065,
                      width: Get.width * 0.5,
                      child: NomalButton(
                        onPressed: controller.nameErrorText.value.isNotEmpty ||
                                controller.name.value.isEmpty
                            ? null
                            : () {
                                //print(Get.arguments['phoneNumber']);
                                controller.phoneNumber.value =
                                    Get.arguments['phoneNumber'];

                                Get.to(() => const SignupUsername(),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
