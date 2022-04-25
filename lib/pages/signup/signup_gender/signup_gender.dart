import 'package:flutter/material.dart';
import 'package:real_app_2/pages/signup/signup_gender/components/signup_gender_body.dart';

class SignupGender extends StatelessWidget {
  const SignupGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupGenderBody(),
    );
  }
}
