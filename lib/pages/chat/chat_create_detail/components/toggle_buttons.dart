import 'package:flutter/material.dart';

class ChatCreateToggleButtons extends StatefulWidget {
  final onPressed;
  final isSelected;
  final fillColor;
  final children;

  const ChatCreateToggleButtons({
    Key? key,
    this.onPressed,
    this.isSelected,
    this.fillColor, this.children,
  }) : super(key: key);

  @override
  State<ChatCreateToggleButtons> createState() =>
      _ChatCreateToggleButtonsState();
}

class _ChatCreateToggleButtonsState extends State<ChatCreateToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: widget.children,
      borderRadius: BorderRadius.circular(10.0),
      borderWidth: 2.0,
      isSelected: widget.isSelected,
      highlightColor: Colors.white,
      fillColor: widget.fillColor,
      onPressed: widget.onPressed,
      selectedColor: Colors.white,
    );
  }
}
