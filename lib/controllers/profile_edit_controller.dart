import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class ProfileEditController extends GetxController {
  static ProfileEditController get to => Get.find();

  //TextEditingController textEditingController = TextEditingController();

  RxString name = '안녕하세요'.obs;
  RxString nameErrorText = ''.obs;
  RxString username = 'gkslnlnls'.obs;
  RxString usernameErrorText = ''.obs;
  RxString website = ''.obs;
  RxString websiteErrorText = ''.obs;
  RxString intro = ''.obs;
  RxString gender = 'none'.obs;
  RxString birth = ''.obs;

  @override
  void onInit() {
    //debounce(name, changedName, time: Duration(milliseconds: 500));
    //debounce(username, changedUsername, time: Duration(milliseconds: 500));
    debounce(website, validateWebsite, time: Duration(milliseconds: 500));
    // TODO: implement onInit
    super.onInit();
  }

  void changedName(String n) {
    name.value = n;
  }

  void changedUsername(String u) {
    username.value = u;
  }

  void changedWebsite(String w) {
    website.value = w;
    print(website.value);
    print(websiteErrorText.value);
  }

  void validateWebsite(String w) {
    websiteErrorText.value = '';
    if (website.value.isNotEmpty) {
      if (_verifyWebsiteTest(w)) {
        websiteErrorText.value = '';
      }
    }
  }

  bool _verifyWebsiteTest(String w) {
    const pattern =
        r'(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(w)) {
      websiteErrorText.value = '올바른 웹사이트를 입력하세요.';
      return false;
    }
    return true;
  }

  void changedIntro(String i) {
    intro.value = i;
  }

  void changedBirth(v) {
    birth(DateFormat('yyyy-MM-dd').format(v));
    print(birth.value);
  }
}
