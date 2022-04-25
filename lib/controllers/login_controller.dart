import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:real_app_2/bindings/login_binding.dart';
import 'package:real_app_2/pages/login/login_main/login_main.dart';
import 'package:real_app_2/pages/login/login_verify/login_verify.dart';
import 'package:real_app_2/utils/api_helper.dart';
import 'package:real_app_2/utils/dio.dart';

import '../bindings/app_binding.dart';
import '../bindings/signup_binding.dart';
import '../pages/app/app.dart';
import '../pages/signup/signup_name/signup_name.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  RxBool isLoading = false.obs;

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController verifyNumberTextController = TextEditingController();

  RxString phoneNumber = ''.obs;
  RxString phoneNumberErrorText = ''.obs;
  RxString verifyNumber = ''.obs;
  RxString verifyNumberErrorText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(phoneNumber, validatePhoneNumber,
        time: const Duration(milliseconds: 500));
    debounce(verifyNumber, validateVerifyNumber,
        time: const Duration(milliseconds: 500));
  }

  void validatePhoneNumber(String p) {
    phoneNumberErrorText.value = '';
    if (p.isNotEmpty) {
      if (_phoneNumberTest(p)) {
        phoneNumberErrorText.value = '';
      }
    }
  }

  void validateFinalPhoneNumber() async {
    phoneNumberErrorText.value = '';
    if (phoneNumber.value.length > 16 || phoneNumber.value.length < 9) {
      phoneNumberErrorText.value = '9자에서 16자 사이 전화번호를 적어주세요.';
    } else if (_phoneNumberTest(phoneNumber.value) &&
        await sms(phoneNumber.value)) {
      phoneNumberErrorText.value = '';
      Get.to(() => const LoginVerify(), binding: LoginBinding());
    }
  }

  void clearPhoneNumber() {
    phoneNumberTextController.clear();
    phoneNumber.value = '';
  }

  bool _phoneNumberTest(String p) {
    const pattern = r'^[0-9]+$';
    const space = r'\s';
    RegExp regExp = RegExp(pattern);
    RegExp regExpSpace = RegExp(space);

    if (p.isEmpty) {
      phoneNumberErrorText.value = '전화번호를 적어 주십시오.';
      return false;
    } else if (regExpSpace.hasMatch(p)) {
      phoneNumberErrorText.value = '공백이 있습니다. 공백을 지워주세요.';
      return false;
    } else if (!regExp.hasMatch(p)) {
      phoneNumberErrorText.value = '숫자만 적어주세요.';
      return false;
    }
    return true;
  }

  void phoneNumberChanged(String p) {
    phoneNumber.value = p;
  }

  void validateVerifyNumber(String v) {
    verifyNumberErrorText.value = '';
    if (v.isNotEmpty) {
      if (_verifyNumberTest(v)) {
        verifyNumberErrorText.value = '';
      }
    }
  }

  void validationFinalVerifyNumber() async {
    verifyNumberErrorText.value = '';
    if (verifyNumber.value.length != 6) {
      verifyNumberErrorText.value = '인증번호는 6자리 입니다.';
    } else if (_verifyNumberTest(verifyNumber.value) &&
        await verify(verifyNumber.value)) {
      verifyNumberErrorText.value = '';
    }
  }

  void clearVerifyNumber() {
    verifyNumberTextController.clear();
    verifyNumber.value = '';
  }

  void verifyPageRePhoneNumber() {
    Get.offAll(() => const LoginMain(), binding: LoginBinding());
  }

  bool _verifyNumberTest(String v) {
    const pattern = r'^[0-9]+$';
    const space = r'\s';

    RegExp regExp = RegExp(pattern);
    RegExp regExpSpace = RegExp(space);

    if (v.isEmpty) {
      verifyNumberErrorText.value = '인증번호를 적어주세요.';

      return false;
    } else if (regExpSpace.hasMatch(v)) {
      verifyNumberErrorText.value = '공백이 있습니다. 공백을 지워주세요.';

      return false;
    } else if (!regExp.hasMatch(v)) {
      verifyNumberErrorText.value = '숫자만 적어주세요.';

      return false;
    }
    return true;
  }

  void verifyNumberChanged(String v) {
    verifyNumber.value = v;
  }

  Future sms(String p) async {
    isLoading(true);
    // final sms =
    await DioHttp().defaultPostDioModel('/auth/SMS', {"phone_number": p});
    // if (sms) {
    //   isLoading.value = false;
    //   return true;
    // } else if (sms["code"] == 10) {
    //   final sms2 =
    //       await DioHttp().defaultPostDioModel('/auth/SMS', {"phone_number": p});
    //   if (sms2["code"] == 1) {
    //     isLoading.value = false;
    //     return true;
    //   } else if (sms2["code"] == 10) {
    //     final sms3 = await DioHttp()
    //         .defaultPostDioModel('/auth/SMS', {"phone_number": p});
    //     if (sms3["code"] == 1) {
    //       isLoading.value = false;
    //       return true;
    //     } else if (sms3["code"] == 10) {
    //       isLoading.value = false;
    //       phoneNumberErrorText.value = '문자전송에 실패했습니다. 다시한번 눌러주세요.';
    //       return false;
    //     }
    //   }
    // }
    // _flutterToast('알수 없는 에러입니다.');
    isLoading.value = false;
    return true;
  }

  Future verify(String v) async {
    print(v);
    isLoading(true);
    // final res = await DioHttp().defaultPostDioModel('/auth/verify',
    //     {"phone_number": phoneNumber.value, "verify_number": v});
    final res = await ApiHelper.instance.post('/auth/verify',
        data: {"phone_number": phoneNumber.value, "verify_number": v});
    if (res["code"] == 1) {
      isLoading.value = false;
      print(res["responseData"]["access_token"]);

      final storage = new FlutterSecureStorage();

      await storage.write(
          key: 'accessToken', value: res["responseData"]["access_token"]);
      await storage.write(
          key: 'refreshToken', value: res["responseData"]["refresh_token"]);
      // await storage.write(
      //     key: 'username', value: res["responseData"]["username"]);

      // print(await storage.read(key: 'username'));

      // savedToken(
      //   res["responseData"]["access_token"],
      //   res["responseData"]["refresh_token"],
      //   res["responseData"]["username"],
      // );
      Get.offAll(() => const App(), binding: AppBinding());
      return true;
    } else if (res["code"] == 2) {
      isLoading.value = false;
      Get.to(
        () => const SignupName(),
        binding: SignupBinding(),
        arguments: {
          'phoneNumber': phoneNumber.value,
        },
      );
      return true;
    } else if (res["code"] == 10) {
      isLoading.value = false;
      verifyNumberErrorText.value = '인증번호가 잘못되었습니다.';
      return false;
    }
    _flutterToast('알수 없는 에러입니다.');
    isLoading.value = false;
    return false;
  }

  void _flutterToast(String msg) async {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  // void savedToken(String a, String r, String u) {
  //   final box = GetStorage();
  //   box.write('accessToken', a);
  //   box.write('refreshToken', r);
  //   box.write('username', u);
  // }
}
