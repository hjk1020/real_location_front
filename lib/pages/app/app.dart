import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_app_2/controllers/app_controller.dart';
import 'package:real_app_2/pages/chat/chat_main/chat_main.dart';
import 'package:real_app_2/pages/community/community_main/community_main.dart';
import 'package:real_app_2/pages/home/home_main/home_main.dart';
import 'package:real_app_2/pages/long_meet/long_meet_main/long_meet_main.dart';
import 'package:real_app_2/pages/profile/profile_main_self/profile_main_self.dart';
import 'package:real_app_2/theme/theme.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(() {
          switch (RouteName.values[controller.currentIndex.value]) {
            case RouteName.Home:
              return const HomeMain();
            case RouteName.Chat:
              return const ChatMain();
            case RouteName.Community:
              return const CommunityMain();
            case RouteName.Profile:
              return const ProfileMainSelf();
          }
        }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.primary,
            onTap: controller.chagePageIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_rounded),
                  label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined),
                  activeIcon: Icon(Icons.chat_rounded),
                  label: '채팅'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group_outlined),
                  activeIcon: Icon(Icons.group_rounded),
                  label: '커뮤니티'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: '프로필',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
