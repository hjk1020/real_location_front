import 'package:flutter/material.dart';
import 'package:real_app_2/pages/signup/signup_name/components/signup_name_body.dart';

class SignupName extends StatelessWidget {
  const SignupName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          body: SignupNameBody(),
        ),
      ),
    );
  }
}
