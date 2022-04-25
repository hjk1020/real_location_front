import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTitle extends StatelessWidget {
  final text;

  const LoginTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: Get.width * 0.065, fontWeight: FontWeight.bold),
    );
  }
}
