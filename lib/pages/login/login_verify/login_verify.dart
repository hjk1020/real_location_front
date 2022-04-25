import 'package:flutter/material.dart';
import 'package:real_app_2/pages/login/login_verify/components/login_verify_body.dart';

class LoginVerify extends StatelessWidget {
  const LoginVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: LoginVerifyBody(),
        ),
      ),
    );
  }
}
