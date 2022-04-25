import 'package:flutter/material.dart';
import 'package:real_app_2/pages/chat/chat_main/components/chat_main_body.dart';

class ChatMain extends StatelessWidget {
  const ChatMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatMainBody(),
    );
  }
}
