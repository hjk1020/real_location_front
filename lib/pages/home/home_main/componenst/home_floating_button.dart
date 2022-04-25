import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:real_app_2/bindings/chat_create_binding.dart';
import 'package:real_app_2/pages/chat/chat_create/chat_create.dart';
import 'package:real_app_2/pages/socket_test.dart';
import 'package:real_app_2/theme/theme.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      elevation: 5.0,
      foregroundColor: Colors.white,
      backgroundColor: AppColor.primary,
      activeBackgroundColor: Colors.white,
      activeForegroundColor: AppColor.primary,
      spaceBetweenChildren: 15.0,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      children: [
        SpeedDialChild(
            onTap: () {},
            labelWidget: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                '방 검색',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            child: const Icon(Icons.search)),
        SpeedDialChild(
            onTap: () {
              Get.to(() => const ChatCreate(), binding: ChatCreateBinding());
            },
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            labelWidget: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                '방 만들기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            child: const Icon(Icons.add)),
               SpeedDialChild(
            onTap: () {
              Get.to(() => const SocketTest());
            },
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            labelWidget: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                '소켓테스트',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            child: const Icon(Icons.add))
      ],
    );
  }
}
