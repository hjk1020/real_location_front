import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/linear_content_textfield.dart';

class ProfileEditIntro extends StatelessWidget {
  const ProfileEditIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('소개'),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('완료'),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LinearContainerTextField(
              labelText: '소개',
            ),
          ),
        ),
      ),
    );
  }
}
