import 'package:get/instance_manager.dart';
import 'package:real_app_2/controllers/app_calendar_controller.dart';

class AppCalendarBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AppCalendarController>(AppCalendarController());
  }
}
