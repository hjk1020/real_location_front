import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/profile_edit_controller.dart';

class ProfileEditBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ProfileEditController>(ProfileEditController());
  }
}
