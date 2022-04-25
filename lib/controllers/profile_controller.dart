import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static ProfileController get to => Get.find();

  TabController? tabController;

  RxBool tabBool = true.obs;

  @override
  void onInit() {
    tabController = TabController(
      vsync: this,
      length: 2,
    );
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    tabController?.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
