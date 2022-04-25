import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  final backgroundImage;
  const ProfileImage({Key? key, required this.backgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000.0),
        child: Image.file(
          backgroundImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
