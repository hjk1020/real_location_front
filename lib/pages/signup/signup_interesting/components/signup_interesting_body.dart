import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_interesting/components/signup_customchip.dart';
import 'package:real_app_2/pages/signup/signup_interesting/components/signup_interesting_list.dart';
import 'package:real_app_2/theme/theme.dart';

class SignupInterestingBody extends GetView<SignupController> {
  const SignupInterestingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(child: BlackProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.1),
                        const Center(child: LoginTitle(text: '관심사를 선택하세요.')),
                        SizedBox(height: Get.height * 0.071),
                        Center(
                          child: Text(
                            '\u{2B50} 3-10개 선택 가능합니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.dark_grey,
                              fontSize: Get.width * 0.032,
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.035),
                        Column(
                          children: List.generate(
                              controller.defaultInteresting.value.length, (i) {
                            return SignupInterestingList(
                              title: controller.defaultInteresting.value.keys
                                  .toList()[i],
                              children: List.generate(
                                  controller
                                      .defaultInteresting
                                      .value[controller
                                          .defaultInteresting.value.keys
                                          .toList()[i]]
                                      .length, (p) {
                                return SignupCustomChip(
                                  label: controller.defaultInteresting.value[
                                      controller.defaultInteresting.value.keys
                                          .toList()[i]][p],
                                );
                              }),
                            );
                          }),
                        ),
                        SizedBox(
                          height: Get.height * 0.09,
                        ),
                      ],
                    ),
            )),
      ),
    );
  }
}
