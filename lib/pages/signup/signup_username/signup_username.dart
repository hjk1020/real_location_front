import 'package:flutter/material.dart';
import 'package:real_app_2/pages/signup/signup_username/components/signup_username.dart';

class SignupUsername extends StatelessWidget {
  const SignupUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SignupUsernameBody(),
        ),
      ),
    );
  }
}
