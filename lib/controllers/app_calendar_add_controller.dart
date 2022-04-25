import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class AppCalendarAddController extends GetxController {
  static AppCalendarAddController get to => Get.find();

  TextEditingController textEditingController = TextEditingController();

  RxString title = ''.obs;

  RxString dateStart = ''.obs;
  RxString dateEnd = ''.obs;
  RxString location = ''.obs;
  RxString locationX = ''.obs;
  RxString locationY = ''.obs;
  RxString content = ''.obs;

  void clearTitle() {
    textEditingController.clear();
    title.value = '';
  }

  void changedTitle(String v) {
    title.value = v;
  }

  void dateReset() {
    dateStart.value = '';
    dateEnd.value = '';
  }

  void changedDateStart(v) {
    dateStart.value = DateFormat('yyyy-MM-dd HH:mm:ss').format(v);
    print(dateStart.value);
  }

  void changedDateEnd(v) {
    dateEnd.value = DateFormat('yyyy-MM-dd HH:mm:ss').format(v);
  }

  void changedContent(v) {
    content.value = v;
  }
}
