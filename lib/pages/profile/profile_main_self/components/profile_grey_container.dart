import 'package:flutter/material.dart';
import 'package:real_app_2/theme/theme.dart';

class ProfileGreyContainer extends StatelessWidget {
  final flex;
  final onTap;
  final child;
  const ProfileGreyContainer({
    Key? key,
    this.flex,
    this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.light_grey,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
