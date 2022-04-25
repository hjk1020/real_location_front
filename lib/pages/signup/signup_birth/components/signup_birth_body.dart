import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_app_2/bindings/signup_binding.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/components/next_text_button.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_profile_image/signup_profile_image.dart';
import 'package:real_app_2/theme/theme.dart';

class SignupBirthBody extends GetView<SignupController> {
  const SignupBirthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();

    return Obx(() => SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    const LoginTitle(text: '생년월일을 입력하세요.'),
                    SizedBox(height: Get.height * 0.13),
                    SizedBox(
                      height: Get.height * 0.25,
                      child: CupertinoDatePicker(
                        onDateTimeChanged: controller.birthChanged,
                        minimumYear: 1900,
                        maximumYear: int.parse(DateFormat('yyyy')
                            .format(DateTime(currentDate.year - 15))),
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateFormat('yyyy-MM-dd').parse(
                          DateTime(currentDate.year - 20, currentDate.month,
                                  currentDate.day)
                              .toString(),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text(
                      '\u{2B50} 만 15세 이상만 이용 가능합니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.dark_grey,
                        fontSize: Get.width * 0.035,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.12),
                    SizedBox(
                      height: Get.height * 0.065,
                      width: Get.width * 0.5,
                      child: NomalButton(
                        onPressed: controller.birth.value.isEmpty
                            ? null
                            : () {
                                Get.to(() => const SignupProfileImage(),
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
                    SizedBox(height: Get.height * 0.05),
                    NextTextButton(
                      onPressed: () {
                        controller.birth.value = '';
                        Get.to(() => const SignupProfileImage(),
                            binding: SignupBinding());
                      },
                      text: '넘어가기',
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
