import 'package:flutter/material.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit_detail/components/profile_edit_detail_body.dart';

class ProfileEditDetail extends StatelessWidget {
  const ProfileEditDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('프로필 변경(상세)'),
        ),
        body: ProfileEditDetailBody(),
      ),
    );
  }
}
