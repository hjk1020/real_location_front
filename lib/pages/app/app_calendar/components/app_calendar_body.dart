import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppCalendarBody extends StatelessWidget {
  const AppCalendarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: Get.height * 0.5,
          child: SfCalendar(
            view: CalendarView.month,
          ),
        ),
      ),
    );
  }
}
