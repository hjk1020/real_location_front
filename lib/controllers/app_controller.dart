import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

enum RouteName { Home, Chat, Community, Profile }

class AppController extends GetxService {
  static AppController get to => Get.find();

  RxInt currentIndex = 0.obs;
  

  void chagePageIndex(int index) {
    currentIndex(index);
  }
}
