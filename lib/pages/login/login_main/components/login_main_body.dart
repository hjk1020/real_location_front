import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/login_binding.dart';
import 'package:real_app_2/components/border_textfiled.dart';
import 'package:real_app_2/components/login_title.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/components/white_progress_indicator.dart';
import 'package:real_app_2/controllers/login_controller.dart';
import 'package:real_app_2/pages/login/login_verify/login_verify.dart';
import 'package:real_app_2/theme/theme.dart';

class LoginMainBody extends StatelessWidget {
  const LoginMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<LoginController>(LoginController());

    return Obx(() => SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.1),
                    const LoginTitle(text: '전화번호를 입력하세요.'),
                    SizedBox(height: Get.height * 0.13),
                    BorderTextField(
                        controller: controller.phoneNumberTextController,
                        hintText: '숫자만 입력하세요.',
                        keyboardType: TextInputType.number,
                        suffixIcon: controller.phoneNumber.value.isEmpty
                            ? null
                            : IconButton(
                                color: AppColor.primary,
                                focusColor: AppColor.primary,
                                icon: Icon(Icons.close),
                                onPressed: controller.clearPhoneNumber,
                              ),
                        onChanged: controller.phoneNumberChanged,
                        errorText: controller.phoneNumberErrorText.value.isEmpty
                            ? null
                            : controller.phoneNumberErrorText.value),
                    SizedBox(height: Get.height * 0.285),
                    SizedBox(
                      height: Get.height * 0.065,
                      width: Get.width * 0.5,
                      child: NomalButton(
                        onPressed: controller.phoneNumber.value.isEmpty
                            ? null
                            : controller.validateFinalPhoneNumber,
                        child: controller.isLoading.value == true
                            ? const WhiteProgressIndicator()
                            : Text(
                                '다음',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
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
