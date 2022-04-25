import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class EmptiedProfileImage extends StatelessWidget {
  const EmptiedProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      child: const CircleAvatar(
          backgroundColor: AppColor.extra_light_grey,
          radius: 1000.0,
          child: Center(
            child: Icon(
              Icons.add_photo_alternate_rounded,
              color: AppColor.light_grey,
              size: 50,
            ),
          )),
    );
  }
}
