import 'package:flutter/material.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/profile_main_self_body.dart';

class ProfileMainSelf extends StatelessWidget {
  const ProfileMainSelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이름'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: ProfileMainSelfBody(),
    );
  }
}
