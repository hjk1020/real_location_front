import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/theme/theme.dart';

class LinearContainerTextField extends StatelessWidget {
  final onChanged;
  final labelText;

  const LinearContainerTextField({Key? key, this.onChanged, this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 150,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      minLines: 1,
      maxLines: 30,
      // expands: true,
      //style: TextStyle(fontSize: 20.0),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColor.light_grey),
      ),
    );
  }
}
