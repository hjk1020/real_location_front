import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupInterestingList extends StatelessWidget {
  final title;
  final children;
  const SignupInterestingList({Key? key, this.title, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: Get.width * 0.05,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: Get.height * 0.02),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Get.width * 1.8,
              minWidth: Get.width * 1.0,
            ),
            child: Wrap (
              spacing: 5.0,
              children: children,
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.044)
      ],
    );
  }
}
