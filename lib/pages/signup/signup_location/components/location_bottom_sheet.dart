import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/components/white_progress_indicator.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/theme/theme.dart';

class LocationBottomSheet extends GetView<SignupController> {
  const LocationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            height: Get.height * 0.45,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  _ListTile(
                    title: '서비스 이용약관(필수)',
                    onChanged: controller.agree1Fun,
                    value: controller.agree1.value,
                    textButtonOnpressed: () {},
                  ),
                  _ListTile(
                    title: '개인정보 수집 및 이용(필수)',
                    onChanged: controller.agree2Fun,
                    value: controller.agree2.value,
                    textButtonOnpressed: () {},
                  ),
                  _ListTile(
                    title: '위치정보 수집 및 이용(필수)',
                    onChanged: controller.agree3Fun,
                    value: controller.agree3.value,
                    textButtonOnpressed: () {},
                  ),
                  CheckboxListTile(
                    value: controller.agree4.value,
                    onChanged: controller.agree4Fun,
                    dense: true,
                    activeColor: Colors.black,
                    title: Text(
                      '만 14세 이상(필수)',
                      style: TextStyle(fontSize: Get.width * 0.04),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    value: controller.agree5.value,
                    onChanged: controller.allAgree,
                    dense: true,
                    activeColor: Colors.black,
                    title: Text(
                      '모두 동의',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.width * 0.05,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0),
                    child: SizedBox(
                      height: Get.height * 0.06,
                      width: double.infinity,
                      child: NomalButton(
                        onPressed: controller.agree5.value
                            ? () {
                                controller.signupUser();
                              }
                            : null,
                        child: controller.isLoading.value
                            ? const Center(child: WhiteProgressIndicator())
                            : Text(
                                '회원가입',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.width * 0.045,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}

class _ListTile extends StatelessWidget {
  final value;
  final onChanged;
  final title;
  final textButtonOnpressed;

  const _ListTile({
    Key? key,
    this.value,
    this.onChanged,
    this.title,
    this.textButtonOnpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      dense: true,
      activeColor: Colors.black,
      title: Text(
        title,
        style: TextStyle(fontSize: Get.width * 0.04),
      ),
      secondary: TextButton(
        onPressed: textButtonOnpressed,
        child: Text(
          '읽기',
          style:
              TextStyle(fontSize: Get.width * 0.04, color: AppColor.light_grey),
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
