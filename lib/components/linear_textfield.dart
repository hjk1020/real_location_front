import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class LinearTextField extends StatefulWidget {
  final onChanged;
  final hint;
  final hintFontSize;
  final suffixIcon;
  final controller;
  final labelText;
  final error;
  final initialValue;
  const LinearTextField(
      {Key? key,
      this.onChanged,
      this.hint,
      this.hintFontSize,
      this.suffixIcon,
      this.controller,
      this.labelText,
      this.error,
      this.initialValue})
      : super(key: key);

  @override
  State<LinearTextField> createState() => _LinearTextFieldState();
}

class _LinearTextFieldState extends State<LinearTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(fontSize: Get.width * 0.045),
      initialValue: widget.initialValue,
      //focusNode: FocusNode(),
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: AppColor.light_grey),
          suffixIcon: widget.suffixIcon,
          errorText: widget.error,
          focusColor: AppColor.light_grey,
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: AppColor.light_grey, fontSize: widget.hintFontSize)),
    );
  }
}
