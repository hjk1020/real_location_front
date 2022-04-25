import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/pages/app/app_calendar/app_calendar_add/components/app_calendar_add_body.dart';

class AppCalendarAdd extends StatelessWidget {
  const AppCalendarAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('일정 추가'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('완료', style: TextStyle(fontSize: Get.width * 0.045)),
          )
        ],
      ),
      body: AppCalendarAddBody(),
    );
  }
}
