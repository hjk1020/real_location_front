import 'package:flutter/material.dart';
import 'package:real_app_2/pages/signup/signup_profile_image/components/signup_profile_image_body.dart';

class SignupProfileImage extends StatelessWidget {
  const SignupProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupProfileImageBody(),
    );
  }
}
