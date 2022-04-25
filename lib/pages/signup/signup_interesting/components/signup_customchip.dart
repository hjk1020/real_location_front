import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:real_app_2/controllers/signup_controller.dart';

class SignupCustomChip extends StatefulWidget {
  final label;
  SignupCustomChip({Key? key, this.label}) : super(key: key);

  @override
  State<SignupCustomChip> createState() => _SignupCustomChipState();
}

class _SignupCustomChipState extends State<SignupCustomChip> {
  SignupController controller = Get.put(SignupController());

  final Color _color = Colors.brown;
  @override
  Widget build(BuildContext context) {
    return Obx(() => FilterChip(
          onSelected: (bool selected) {
            if (selected) {
              print(controller.interesting.value);
              print(controller.interesting.length);
              if (controller.interesting.length > 9) {
                Fluttertoast.showToast(
                  msg: '10개 이상 선택할 수 없습니다.',
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.red,
                );
              } else {
                controller.interesting.add(widget.label);
              }
            } else {
              controller.interesting.remove(widget.label);
            }
          },
          label: Text(
            widget.label,
            style: controller.interesting.contains(widget.label)
                ? TextStyle(color: Colors.white, fontSize: Get.width * 0.05)
                : TextStyle(
                    color: _color,
                    fontSize: Get.width * 0.05,
                  ),
          ),
          showCheckmark: false,
          backgroundColor: Colors.white,
          selectedColor: _color,
          selected: controller.interesting.contains(widget.label),
          shape: StadiumBorder(
            side: BorderSide(color: _color, width: 1.0),
          ),
        ));
  }
}
