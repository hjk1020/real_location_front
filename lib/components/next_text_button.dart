import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class NextTextButton extends StatelessWidget {
  final onPressed;
  final text;
  const NextTextButton({Key? key, this.onPressed, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.dark_grey,
          fontSize: Get.width * 0.05,
        ),
      ),
    );
  }
}
