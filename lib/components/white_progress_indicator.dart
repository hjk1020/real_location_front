import 'package:flutter/material.dart';

class WhiteProgressIndicator extends StatelessWidget {
  const WhiteProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Colors.white
    );
  }
}