import 'package:flutter/material.dart';
import 'package:real_app_2/pages/chat/chat_create_location/chat_create_location_dong/components/body.dart';

class ChatCreateLocationDong extends StatelessWidget {
  const ChatCreateLocationDong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('법정동 입력'),
         
        ),
        body: ChatCreateLocationDongBody(),
      ),
    );
  }
}
