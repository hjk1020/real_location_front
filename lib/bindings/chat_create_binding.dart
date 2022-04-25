import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';

class ChatCreateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChatCreateController>(ChatCreateController());
  }
}
