import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/linear_textfield.dart';

class ProfileEditDetailPhone extends StatelessWidget {
  const ProfileEditDetailPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('전화번호 변경'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.06,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 17,
                          child: LinearTextField(
                            onChanged: (v) {},
                            labelText: '전화번호',
                          ),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    height: Get.height * 0.06,
                    child: LinearTextField(
                      onChanged: (v) {},
                      labelText: '인증번호',
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
