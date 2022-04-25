import 'package:flutter/material.dart';
import 'package:real_app_2/pages/signup/signup_birth/components/signup_birth_body.dart';

class SignupBirth extends StatelessWidget {
  const SignupBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SignupBirthBody(),
      ),
    );
  }
}
