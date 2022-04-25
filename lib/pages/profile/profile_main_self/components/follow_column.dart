
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowColumn extends StatelessWidget {
  final count;
  final follow;
  final onTap;
  const FollowColumn({
    Key? key,
    this.count,
    this.follow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: Get.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              follow,
              style: TextStyle(fontSize: Get.width * 0.035),
            )
          ],
        ),
      ),
    );
  }
}