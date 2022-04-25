import 'package:flutter/material.dart';
import 'package:real_app_2/theme/theme.dart';

class NomalButton extends StatelessWidget {
  final onPressed;
  final child;
  const NomalButton({Key? key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColor.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}
