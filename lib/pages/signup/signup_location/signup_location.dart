import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/pages/signup/signup_location/components/location_bottom_sheet.dart';
import 'package:real_app_2/pages/signup/signup_location/components/signup_location_body.dart';

class SignupLocation extends StatelessWidget {
  const SignupLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Obx(
            () => Scaffold(
              appBar: AppBar(
                title: const Text('내 위치 입력'),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: TextButton(
                      onPressed: controller.locationX.value.isEmpty
                          ? null
                          : () {
                              controller.getToken();
                              Get.bottomSheet( const LocationBottomSheet());
                            },
                      child: Text(
                        '완료',
                        style: TextStyle(fontSize: Get.width * 0.045),
                      ),
                    ),
                  )
                ],
              ),
              resizeToAvoidBottomInset: false,
              body: const SignupLocationBody(),
            ),
          ),
        ));
  }
}
