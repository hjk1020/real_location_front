import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class GreyContainerTextField extends StatefulWidget {
  final keyboardType;
  final onChanged;
  final hint;
  final error;
  final maxLength;
  final suffixIcon;
  final controller;

  const GreyContainerTextField(
      {Key? key,
      this.keyboardType,
      this.onChanged,
      this.hint,
      this.error,
      this.maxLength,
      this.suffixIcon,
      this.controller})
      : super(key: key);

  @override
  State<GreyContainerTextField> createState() => _GreyContainerTextFieldState();
}

class _GreyContainerTextFieldState extends State<GreyContainerTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      textAlign: TextAlign.start,
      keyboardType: widget.keyboardType,
      textAlignVertical: TextAlignVertical.center,
      maxLength: widget.maxLength,
      style: TextStyle(
        fontSize: Get.width * 0.045,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.suffixIcon,
        isDense: true,
        filled: true,
        errorText: widget.error,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        fillColor: AppColor.extra_extra_light_grey,
        hintMaxLines: 2,
        hintStyle:
            TextStyle(color: AppColor.dark_grey, fontSize: Get.width * 0.045),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
