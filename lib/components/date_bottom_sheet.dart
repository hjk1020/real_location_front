import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomSheetShow extends StatelessWidget {
  final cancelOnPressed;
  final choiceOnPressed;
  final onDateTimeChanged;
  final minimumDate;
  final initialDateTime;
  final maximumDate;
  final minuteInterval;

  const BottomSheetShow({
    Key? key,
    this.cancelOnPressed,
    this.choiceOnPressed,
    this.onDateTimeChanged,
    this.minimumDate,
    this.initialDateTime,
    this.maximumDate, this.minuteInterval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentDateTime = DateTime.now();

    return SizedBox(
      height: Get.height * 0.3,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextButton(
                    onPressed: cancelOnPressed,
                    child: Text(
                      '취소',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: Get.width * 0.05,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: choiceOnPressed,
                    child: Text(
                      '선택',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: Get.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: CupertinoDatePicker(
                minuteInterval: minuteInterval,
                onDateTimeChanged: onDateTimeChanged,
                mode: CupertinoDatePickerMode.dateAndTime,
                maximumDate: maximumDate,
                minimumDate: minimumDate,
                initialDateTime: initialDateTime),
          )
        ],
      ),
    );
  }
}
