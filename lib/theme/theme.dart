import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'colors.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColor.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white,
      iconTheme: IconThemeData(color: AppColor.primary),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.primary,
        fontSize: Get.width * 0.05,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),

    ),
  );
}
