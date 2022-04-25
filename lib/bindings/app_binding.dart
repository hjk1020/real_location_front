import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AppController>(AppController());
  }
}
