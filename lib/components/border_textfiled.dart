import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class BorderTextField extends StatefulWidget {
  final keyboardType;
  final hintText;
  final errorText;
  final controller;
  final suffixIcon;
  final onChanged;

  const BorderTextField(
      {Key? key,
      this.keyboardType,
      this.hintText,
      this.errorText,
      this.controller,
      this.suffixIcon,
      this.onChanged})
      : super(key: key);

  @override
  State<BorderTextField> createState() => _BorderTextFieldState();
}

class _BorderTextFieldState extends State<BorderTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(fontSize: Get.width * 0.045),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintMaxLines: 2,
            hintStyle: const TextStyle(
              color: AppColor.light_grey,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primary,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primary,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primary,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: AppColor.primary,
            //     width: 3.0,
            //   ),
            //   borderRadius: BorderRadius.circular(10.0),
            // ),

            errorText: widget.errorText,
            suffixIcon: widget.suffixIcon,
          ),
        )
      ],
    );
  }
}
