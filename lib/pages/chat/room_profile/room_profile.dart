import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/nomal_button.dart';
import 'package:real_app_2/controllers/room_profile_controller.dart';
import 'package:real_app_2/pages/chat/room_profile/components/room_profile_body.dart';
import 'package:real_app_2/theme/theme.dart';

class RoomProfile extends GetView<RoomProfileController> {
  const RoomProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
              title: Text('${controller.roomProfile.value.title}'),
              actions: [
                const Icon(Icons.favorite_border),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.more_vert),
                )
              ]),
          body: const RoomProfileBody(),
          floatingActionButton: FloatingActionButton.extended(
            label: Text('가입'),
            backgroundColor: AppColor.primary,
            onPressed: () {},
            //elevation: 0,
            // child: Icon(Icons.arrow_forward),
            tooltip: '가입',
          ),
          
        ));
  }
}
