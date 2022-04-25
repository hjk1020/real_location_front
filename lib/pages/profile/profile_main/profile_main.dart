import 'package:flutter/material.dart';
import 'package:real_app_2/pages/profile/profile_main/components/profile_main_body.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('미나'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: ProfileMainBody(),
    );
  }
}
