import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class GreyContainer extends StatelessWidget {
  final hint;
  final onTap;
  const GreyContainer({Key? key, this.hint, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColor.extra_extra_light_grey,
        ),
        child: Text(
          hint,
          textAlign: TextAlign.left,
          style:
              TextStyle(color: AppColor.dark_grey, fontSize: Get.width * 0.045),
        ),
      ),
    );
  }
}
