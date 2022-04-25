import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:real_app_2/bindings/login_binding.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/components/white_progress_indicator.dart';
import 'package:real_app_2/controllers/login_controller.dart';
import 'package:real_app_2/pages/login/login_main/login_main.dart';
import 'package:real_app_2/theme/theme.dart';

class LoginVerifyBody extends GetView<LoginController> {
  const LoginVerifyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.1),
                  const LoginTitle(text: '인증번호를 입력하세요.'),
                  SizedBox(height: Get.height * 0.13),
                  SizedBox(
                    child: PinCodeTextField(
                      controller: controller.verifyNumberTextController,
                      appContext: context,
                      autoFocus: true,
                      keyboardType: TextInputType.number,
                      length: 6,
                      onChanged: controller.verifyNumberChanged,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        inactiveColor:
                            controller.verifyNumberErrorText.value.isEmpty
                                ? AppColor.primary
                                : Colors.red,
                        activeColor:
                            controller.verifyNumberErrorText.value.isEmpty
                                ? AppColor.primary
                                : Colors.red,
                        selectedColor:
                            controller.verifyNumberErrorText.value.isEmpty
                                ? AppColor.primary
                                : Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Text(
                    controller.verifyNumberErrorText.value.isEmpty
                        ? ''
                        : controller.verifyNumberErrorText.value,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: Get.width * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Get.height * 0.1),
                  TextButton(
                      onPressed: controller.verifyNumberErrorText.value.isEmpty
                          ? null
                          : controller.clearVerifyNumber,
                      child: Text(
                        controller.verifyNumberErrorText.value.isEmpty
                            ? ''
                            : '다시입력',
                        style: TextStyle(
                            fontSize: Get.height * 0.02,
                            color: AppColor.light_grey),
                      )),
                  SizedBox(height: Get.height * 0.1),
                  AnimatedCrossFade(
                    firstChild: TextButton(
                      onPressed: controller.verifyPageRePhoneNumber,
                      child: Text(
                        '인증번호 다시받기',
                        style: TextStyle(
                            color: AppColor.dark_grey,
                            fontSize: Get.height * 0.021),
                      ),
                    ),
                    secondChild: SizedBox(
                      height: Get.height * 0.065,
                      width: Get.width * 0.5,
                      child: NomalButton(
                        onPressed: controller.verifyNumber.value.length == 6
                            ? controller.validationFinalVerifyNumber
                            : null,
                        child: controller.isLoading.value == true
                            ? const WhiteProgressIndicator()
                            : Text(
                                '다음',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: Get.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    crossFadeState:
                        controller.verifyNumberErrorText.value.isEmpty
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
