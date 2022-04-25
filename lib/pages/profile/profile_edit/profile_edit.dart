import 'package:flutter/material.dart';
import 'package:real_app_2/pages/profile/profile_edit/components/profile_edit_body.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('프로필 변경'),
          centerTitle: true,
        ),
        body: ProfileEditBody(),
      ),
    );
  }
}
