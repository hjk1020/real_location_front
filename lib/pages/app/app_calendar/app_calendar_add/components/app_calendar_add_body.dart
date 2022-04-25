import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_app_2/components/date_bottom_sheet.dart';
import 'package:real_app_2/components/grey_container.dart';
import 'package:real_app_2/components/grey_container_text_field.dart';
import 'package:real_app_2/components/grey_content_text_field.dart';
import 'package:real_app_2/components/linear_textfield.dart';
import 'package:real_app_2/controllers/app_calendar_add_controller.dart';
import 'package:real_app_2/theme/theme.dart';

class AppCalendarAddBody extends GetView<AppCalendarAddController> {
  const AppCalendarAddBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var current = DateTime.now();
    var initial = DateFormat('yyyy-MM-dd HH:mm:ss').parse(DateTime(
      current.year,
      current.month,
      current.day + 1,
    ).toString());

    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SizedBox(
                  height: Get.height * 0.05,
                  child: GreyContainerTextField(
                    controller: controller.textEditingController,
                    onChanged: controller.changedTitle,
                    hint: '일정 제목',
                    suffixIcon: controller.title.value.isEmpty
                        ? null
                        : IconButton(
                            onPressed: controller.clearTitle,
                            icon: Icon(
                              Icons.close,
                              color: AppColor.dark_grey,
                            )),
                  ),
                ),
              ),
              Divider(color: AppColor.dark_grey),
              SizedBox(
                height: Get.height * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '시작 :',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.045),
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: TextButton(
                                    onPressed: () {
                                      timeStart(context, initial);
                                    },
                                    child: Text(
                                      controller.dateStart.value.isEmpty
                                          ? '클릭'
                                          : DateFormat.yMd().add_jm().format(
                                                DateFormat(
                                                        'yyyy-MM-dd HH:mm:ss')
                                                    .parse(controller
                                                        .dateStart.value),
                                              ),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.045,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '종료 : ',
                                    style:
                                        TextStyle(fontSize: Get.width * 0.045),
                                  ),
                                ),
                                Expanded(
                                  flex: 9,
                                  child: TextButton(
                                    onPressed: controller
                                            .dateStart.value.isEmpty
                                        ? null
                                        : () {
                                            var start = DateFormat(
                                                    'yyyy-MM-dd HH:mm:ss')
                                                .parse(
                                                    controller.dateStart.value);
                                            timeEnd(context, start);
                                          },
                                    child: Text(
                                      controller.dateEnd.value.isEmpty
                                          ? '클릭'
                                          : DateFormat.yMd().add_jm().format(
                                              DateFormat('yyyy-MM-dd HH:mm:ss')
                                                  .parse(controller
                                                      .dateEnd.value)),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        // color: AppColor.dark_grey,
                                        fontSize: Get.width * 0.045,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: controller.dateReset,
                        child: Text(
                          '리셋',
                          style: TextStyle(
                              fontSize: Get.width * 0.045,
                              color: AppColor.dark_grey,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SizedBox(
                  height: Get.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SizedBox(
                            height: Get.height * 0.05,
                            child: GreyContainer(
                              hint: '위치',
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.my_location,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SizedBox(
                  height: Get.height * 0.2,
                  child: GreyContentTextField(
                    hint: '내용',
                    onChanged: controller.changedContent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> timeEnd(BuildContext context, DateTime start) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheetShow(
            cancelOnPressed: () {
              Navigator.pop(context);
              controller.dateEnd.value = '';
            },
            choiceOnPressed: () {
              Navigator.pop(context);
            },
            onDateTimeChanged: controller.changedDateEnd,
            initialDateTime: start,
            minimumDate: start,
            minuteInterval: 1,
          );
        });
  }

  Future<dynamic> timeStart(BuildContext context, DateTime initial) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheetShow(
            cancelOnPressed: () {
              Navigator.pop(context);
              controller.dateStart.value = '';
              controller.dateEnd.value = '';
            },
            choiceOnPressed: () {
              Navigator.pop(context);
            },
            onDateTimeChanged: controller.changedDateStart,
            initialDateTime: initial,
            minuteInterval: 1,
          );
        });
  }
}
