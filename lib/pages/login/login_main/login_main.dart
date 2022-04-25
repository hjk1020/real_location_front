import 'package:flutter/material.dart';
import 'package:real_app_2/pages/login/login_main/components/login_main_body.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: LoginMainBody(),
        ),
      ),
    );
  }
}
