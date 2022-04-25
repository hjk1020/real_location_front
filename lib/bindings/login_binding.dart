import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
