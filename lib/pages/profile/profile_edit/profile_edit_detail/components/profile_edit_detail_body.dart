import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_app_2/components/linear_textfield.dart';
import 'package:real_app_2/controllers/profile_edit_controller.dart';
import 'package:real_app_2/theme/theme.dart';

class ProfileEditDetailBody extends GetView<ProfileEditController> {
  const ProfileEditDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Get.height * 0.07,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 20,
                            child: LinearTextField(
                              labelText: '전화번호',
                            ),
                          ),
                          Spacer(flex: 1),
                          Expanded(
                              flex: 2,
                              child: Icon(Icons.arrow_forward_outlined))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colors.transparent,
                        height: Get.height * 0.07,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: Get.height * 0.06,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '성별',
                            style: TextStyle(
                                fontSize: Get.width * 0.045,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 9,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.gender.value = 'male';
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                      border: Border.all(
                                          color: AppColor.extra_light_grey,
                                          width: 2.0),
                                      color: controller.gender.value == 'male'
                                          ? Colors.blue
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.male,
                                        size: Get.height * 0.04,
                                        color: controller.gender.value == 'male'
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.gender.value = 'female';
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: controller.gender.value == 'female'
                                          ? Colors.red
                                          : Colors.white,
                                      border: Border.all(
                                        color: AppColor.extra_light_grey,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.female,
                                        size: Get.height * 0.04,
                                        color:
                                            controller.gender.value == 'female'
                                                ? Colors.white
                                                : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.gender.value = 'none';
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: controller.gender.value == 'none'
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                      border: Border.all(
                                        color: AppColor.extra_light_grey,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.close,
                                        size: Get.height * 0.04,
                                        color: controller.gender.value == 'none'
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '⭐ 성별을 변경하면 다음 15일 동안 변경할 수 없습니다.',
                    style: TextStyle(color: AppColor.light_grey),
                  ),
                ),
                Divider(color: AppColor.light_grey),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: Get.height * 0.06,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '생일',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 15,
                          child: Container(
                            child: Center(
                              child: Text(
                                controller.birth.value,
                                style: TextStyle(fontSize: Get.width * 0.04),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: Get.height * 0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        '취소',
                                                        style: TextStyle(
                                                            fontSize:
                                                                Get.width *
                                                                    0.045,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(flex: 4),
                                                  Expanded(
                                                    flex: 2,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        '선택',
                                                        style: TextStyle(
                                                            fontSize:
                                                                Get.width *
                                                                    0.045),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                onDateTimeChanged:
                                                    controller.changedBirth,
                                                minimumYear: 1900,
                                                maximumYear: int.parse(
                                                    DateFormat('yyyy').format(
                                                        DateTime(
                                                            currentDate.year -
                                                                15))),
                                                initialDateTime:
                                                    DateFormat('yyyy-MM-dd')
                                                        .parse(
                                                  DateTime(
                                                          currentDate.year - 20,
                                                          currentDate.month,
                                                          currentDate.day)
                                                      .toString(),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '⭐ 생일을 변경하면 다음 15일 동안 변경할 수 없습니다.',
                    style: TextStyle(color: AppColor.light_grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
