import 'package:flutter/material.dart';

class BlackProgressIndicator extends StatelessWidget {
  const BlackProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const CircularProgressIndicator(
      color: Colors.black,
      
    );
  }
}
