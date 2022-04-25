
import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  final onPressed;
  final text;
  final color;
  const CommunityTab({
    Key? key,
    this.onPressed,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style:  const ButtonStyle(
          splashFactory: NoSplash.splashFactory
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
