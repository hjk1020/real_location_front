import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/signup_binding.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/components/next_text_button.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_birth/signup_birth.dart';
import 'package:real_app_2/theme/theme.dart';

class SignupGenderBody extends GetView<SignupController> {
  const SignupGenderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(() => Column(
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    const LoginTitle(text: '성별을 선택하세요.'),
                    SizedBox(height: Get.height * 0.13),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent,
                              ),
                            ),
                            onPressed: () {
                              controller.gender.value = 'MALE';
                            },
                            child: Text(
                              '남',
                              style: controller.gender.value == 'MALE'
                                  ? TextStyle(
                                      fontFamily: 'Dohyun',
                                      fontSize: Get.width * 0.2,
                                      color: Colors.white,
                                      backgroundColor: Colors.lightBlue,
                                    )
                                  : TextStyle(
                                      fontFamily: 'Dohyun',
                                      fontSize: Get.width * 0.2,
                                      color: Colors.lightBlue),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                Colors.transparent,
                              ),
                            ),
                            onPressed: () {
                              controller.gender.value = 'FEMALE';
                            },
                            child: Text(
                              '여',
                              style: controller.gender.value == 'FEMALE'
                                  ? TextStyle(
                                      fontFamily: 'Dohyun',
                                      fontSize: Get.width * 0.2,
                                      color: Colors.white,
                                      backgroundColor: Colors.pink,
                                    )
                                  : TextStyle(
                                      fontFamily: 'Dohyun',
                                      fontSize: Get.width * 0.2,
                                      color: Colors.pink,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      '\u{2B50} 성별을 선택해야 합니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.dark_grey,
                          fontSize: Get.width * 0.032),
                    ),
                    SizedBox(height: Get.height * 0.175),
                    SizedBox(
                      height: Get.height * 0.065,
                      width: Get.width * 0.5,
                      child: NomalButton(
                        onPressed: controller.gender.value == 'UNKNOWN'
                            ? null
                            : () {
                                print(controller.phoneNumber.value);
                                print(controller.name.value);
                                Get.to(() => const SignupBirth(),
                                    binding: SignupBinding());
                              },
                        child: Text(
                          '다음',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: Get.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    NextTextButton(
                      onPressed: () {
                        controller.gender.value = 'UNKNOWN';
                        Get.to(() => const SignupBirth(),
                            binding: SignupBinding());
                      },
                      text: '넘어가기',
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
