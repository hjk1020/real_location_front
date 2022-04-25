import 'package:flutter/material.dart';
import 'package:real_app_2/pages/signup/signup_interesting/components/signup_interesting_body.dart';
import 'package:real_app_2/pages/signup/signup_interesting/components/signup_interesting_bottom_sheet.dart';

class SignupInteresting extends StatelessWidget {
  const SignupInteresting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignupInterestingBody(),
      bottomSheet: SignupInterestingBottomSheet(),
    );
  }
}
