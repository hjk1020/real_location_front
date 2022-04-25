import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/room_profile_controller.dart';

class RoomProfileBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<RoomProfileController>(RoomProfileController());
  }
}
