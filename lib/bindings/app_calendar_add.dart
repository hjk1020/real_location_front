import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/app_calendar_add_controller.dart';

class AppCalendarAddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppCalendarAddController>(AppCalendarAddController());
  }
}
