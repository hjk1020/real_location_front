import 'package:flutter/material.dart';
import 'package:real_app_2/pages/app/app_calendar/components/app_calendar_body.dart';
import 'package:real_app_2/theme/theme.dart';

class AppCalendar extends StatelessWidget {
  const AppCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('달력'),
        centerTitle: true,
      ),
      body: AppCalendarBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.primary,
        child: Icon(Icons.add),
      ),
    );
  }
}
