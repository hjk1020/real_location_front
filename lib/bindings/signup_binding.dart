import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController());
    // TODO: implement dependencies
  }
}
