import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class GreyContentTextField extends StatelessWidget {
  final onChanged;
  final hint;

  const GreyContentTextField({Key? key, this.onChanged, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
      expands: true,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(
              color: AppColor.light_grey, fontSize: Get.width * 0.045),
          fillColor: AppColor.extra_extra_light_grey,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          )),
    );
  }
}
