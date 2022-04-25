import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_app_2/bindings/signup_binding.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_location/signup_location.dart';

class SignupInterestingBottomSheet extends GetView<SignupController> {
  const SignupInterestingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.1,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() => NomalButton(
                onPressed: controller.interesting.length < 3 ||
                        controller.interesting.length > 10
                    ? null
                    : () {
                        controller.interestingHttp();
                        //print(controller.interesting.value);
                        Get.to(() => const SignupLocation(),
                            binding: SignupBinding());
                      },
                child: Text(
                  '다음',
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
                  ),
                ),
              )),
        ));
  }
}
