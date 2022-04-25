import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:real_app_2/components/date_bottom_sheet.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/pages/chat/chat_create_detail/components/toggle_buttons.dart';
import 'package:real_app_2/theme/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ChatCreateDetailBody extends StatefulWidget {
  ChatCreateDetailBody({Key? key}) : super(key: key);

  @override
  State<ChatCreateDetailBody> createState() => _ChatCreateDetailBodyState();
}

class _ChatCreateDetailBodyState extends State<ChatCreateDetailBody> {
  final ChatCreateController controller = Get.put(ChatCreateController());

  List<bool> _genderList = [false, false, true];
  final Color _color = Colors.brown;
  int _chipindex = 0;

  @override
  Widget build(BuildContext context) {
    var currentNow = DateTime.now();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () => Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.ageBool.value = !controller.ageBool.value;
                },
                child: SizedBox(
                  height: Get.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.manage_accounts,
                          size: Get.width * 0.045,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '연령대',
                          style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Text(
                          controller.ageRange.value,
                          style: TextStyle(fontSize: Get.width * 0.045),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: controller.ageBool.value == false
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                size: Get.width * 0.08,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up,
                                size: Get.width * 0.08,
                              ),
                      )
                    ],
                  ),
                ),
              ),
              if (controller.ageBool.value == true)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: Get.height * 0.05,
                    child: SfRangeSlider(
                      onChanged: controller.changedAge,
                      min: 10.0,
                      max: 50.0,
                      interval: 10,
                      stepSize: 10,
                      showTicks: true,
                      showLabels: true,
                      activeColor: AppColor.primary,
                      inactiveColor: AppColor.light_grey,
                      values: controller.values.value,
                    ),
                  ),
                ),
              const Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: Get.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.safety_divider,
                          size: Get.width * 0.045,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '성별',
                          style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 6,
                        child: ChatCreateToggleButtons(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.male,
                                color: controller.gender.value == 'MALE'
                                    ? Colors.white
                                    : Colors.blue,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.female,
                                color: controller.gender.value == 'FEMALE'
                                    ? Colors.white
                                    : Colors.red,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                Icons.close,
                                color: controller.gender.value == 'UNKNOWN'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )
                          ],
                          onPressed: (v) {
                            if (v == 0) {
                              controller.gender.value = 'MALE';
                              setState(() {
                                _genderList = [true, false, false];
                              });
                            } else if (v == 1) {
                              controller.gender.value = 'FEMALE';
                              setState(() {
                                _genderList = [false, true, false];
                              });
                            } else {
                              controller.gender.value = 'UNKNOWN';
                              setState(() {
                                _genderList = [false, false, true];
                              });
                            }
                          },
                          isSelected: _genderList,
                          fillColor: controller.gender.value == 'MALE'
                              ? Colors.blue
                              : controller.gender.value == 'FEMALE'
                                  ? Colors.red
                                  : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: Get.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.filter_tilt_shift,
                          size: Get.width * 0.045,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '주제',
                          style: TextStyle(
                              fontSize: Get.width * 0.045,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 4,
                        child: Container(),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.density_medium,
                              size: Get.width * 0.08,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: Get.height * 0.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.subInterestingList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.interesting.value =
                                controller.subInterestingList.value[index];
                            setState(() {
                              _chipindex = index;
                            });
                          },
                          child: Chip(
                            label: Text(
                                controller.subInterestingList.value[index]),
                            side: BorderSide(color: _color, width: 2.0),
                            labelStyle: TextStyle(
                              color:
                                  index == _chipindex ? Colors.white : _color,
                            ),
                            backgroundColor:
                                index == _chipindex ? _color : AppColor.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.expiryTimeBool.value =
                        !controller.expiryTimeBool.value;
                  },
                  child: SizedBox(
                    height: Get.height * 0.05,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.access_time_outlined,
                            size: Get.width * 0.045,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '모임종료',
                            style: TextStyle(
                                fontSize: Get.width * 0.045,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 5,
                          child: Text(
                            // '3.20(일) 오후 2시',
                            '${controller.expiryTime.value.toString()}일 후',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: controller.expiryTimeBool.value == true
                              ? Icon(
                                  Icons.keyboard_arrow_up,
                                  size: Get.width * 0.08,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_down,
                                  size: Get.width * 0.08,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (controller.expiryTimeBool.value == true)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: Get.height * 0.05,
                    child: SfSlider(
                      min: 0.0,
                      max: 20.0,
                      value: controller.expiryTime.value,
                      interval: 10,
                      stepSize: 1,
                      showTicks: true,
                      showLabels: true,
                      activeColor: AppColor.primary,
                      inactiveColor: AppColor.light_grey,
                      onChanged: (v) {
                        controller.expiryTime.value = v.toInt();
                      },
                    ),
                  ),
                ),
              const Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    controller.limitPersonBool.value =
                        !controller.limitPersonBool.value;
                  },
                  child: SizedBox(
                    height: Get.height * 0.05,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.emoji_people,
                            size: Get.width * 0.045,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '제한인원',
                            style: TextStyle(
                                fontSize: Get.width * 0.045,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${controller.limitPerson.value.toString()}명',
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: controller.limitPersonBool.value == true
                              ? Icon(
                                  Icons.keyboard_arrow_up,
                                  size: Get.width * 0.08,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_down,
                                  size: Get.width * 0.08,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (controller.limitPersonBool.value == true)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: Get.height * 0.05,
                    child: SfSlider(
                      min: 2.0,
                      max: 20.0,
                      value: controller.limitPerson.value,
                      interval: 6,
                      stepSize: 1,
                      showTicks: true,
                      showLabels: true,
                      activeColor: AppColor.primary,
                      inactiveColor: AppColor.light_grey,
                      onChanged: (v) {
                        controller.limitPerson.value = v.toInt();
                      },
                    ),
                  ),
                ),
              const Divider(color: AppColor.dark_grey),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: GestureDetector(
              //     onTap: () {
              //       if (controller.offlineMeetingBool.value == true) {
              //         controller.offlineMeetingBool.value = false;
              //       } else {
              //         controller.offlineMeetingBool.value = true;
              //       }
              //     },
              //     child: SizedBox(
              //       height: Get.height * 0.05,
              //       child: Row(
              //         children: [
              //           Expanded(
              //             flex: 1,
              //             child: Icon(
              //               Icons.access_time_outlined,
              //               size: Get.width * 0.045,
              //             ),
              //           ),
              //           Expanded(
              //             flex: 2,
              //             child: Text(
              //               '만남일시(선택)',
              //               style: TextStyle(
              //                   fontSize: Get.width * 0.045,
              //                   fontWeight: FontWeight.w600),
              //             ),
              //           ),
              //           Expanded(
              //             flex: 6,
              //             child: Padding(
              //               padding: const EdgeInsets.only(left: 10.0),
              //               child: Container(
              //                 child: Column(
              //                   children: [
              //                     Expanded(
              //                       child: Row(
              //                         children: [
              //                           Text('시작 : '),
              //                           Text(
              //                             controller.offlineMeetingStart.value
              //                                     .isEmpty
              //                                 ? ''
              //                                 : DateFormat.yMd()
              //                                     .add_jm()
              //                                     .format(
              //                                       DateFormat(
              //                                               'yyyy-MM-dd HH:mm:ss')
              //                                           .parse(controller
              //                                               .offlineMeetingStart
              //                                               .value),
              //                                     ),
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                     Expanded(
              //                       child: Row(
              //                         children: [
              //                           Text('종료 : '),
              //                           Text(
              //                             controller.offlineMeetingEnd.value
              //                                     .isEmpty
              //                                 ? ''
              //                                 : DateFormat.yMd()
              //                                     .add_jm()
              //                                     .format(
              //                                       DateFormat(
              //                                               'yyyy-MM-dd HH:mm:ss')
              //                                           .parse(controller
              //                                               .offlineMeetingEnd
              //                                               .value),
              //                                     ),
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             flex: 1,
              //             child: controller.offlineMeetingBool.value == true
              //                 ? Icon(Icons.keyboard_arrow_up,
              //                     size: Get.width * 0.08)
              //                 : Icon(
              //                     Icons.keyboard_arrow_down,
              //                     size: Get.width * 0.08,
              //                   ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // if (controller.offlineMeetingBool.value)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 10.0),
              //     child: SizedBox(
              //       height: Get.height * 0.05,
              //       child: Row(
              //         children: [
              //           Spacer(flex: 1),
              //           Expanded(
              //             flex: 1,
              //             child: TextButton(
              //               onPressed: () {
              //                 var initial = DateFormat('yyyy-MM-dd HH:mm:ss')
              //                     .parse(DateTime(
              //                   currentNow.year,
              //                   currentNow.month,
              //                   currentNow.day + 1,
              //                 ).toString());

              //                 controller.offlineMeetingStart.value =
              //                     DateFormat('yyyy-MM-dd HH:mm:ss')
              //                         .format(initial);

              //                 showModalBottomSheet(
              //                     context: context,
              //                     builder: (BuildContext context) {
              //                       return BottomSheetShow(
              //                         cancelOnPressed: () {
              //                           Navigator.pop(context);
              //                           controller.offlineMeetingStart.value =
              //                               '';
              //                           controller.offlineMeetingEnd.value = '';
              //                         },
              //                         choiceOnPressed: () {
              //                           Navigator.pop(context);
              //                           print(controller
              //                               .offlineMeetingStart.value);
              //                         },
              //                         onDateTimeChanged: (v) {
              //                           controller.offlineMeetingStart.value =
              //                               DateFormat('yyyy-MM-dd HH:mm:ss')
              //                                   .format(v);
              //                         },
              //                         initialDateTime: initial,
              //                         minimumDate: currentNow,
              //                         minuteInterval: 10,
              //                         maximumDate:
              //                             DateFormat('yyyy-MM-dd HH:mm:ss')
              //                                 .parse(DateTime(
              //                           currentNow.year,
              //                           currentNow.month,
              //                           currentNow.day + 31,
              //                         ).toString()),
              //                       );
              //                     });
              //               },
              //               child: Text(
              //                 '시작',
              //                 style: TextStyle(
              //                   fontSize: Get.width * 0.045,
              //                   decoration: TextDecoration.underline,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Spacer(flex: 1),
              //           Expanded(
              //             flex: 1,
              //             child: TextButton(
              //               onPressed:
              //                   controller.offlineMeetingStart.value.isEmpty
              //                       ? null
              //                       : () {
              //                           var initialEnd =
              //                               DateFormat('yyyy-MM-dd HH:mm:ss')
              //                                   .parse(controller
              //                                       .offlineMeetingStart.value);
              //                           controller.offlineMeetingEnd.value =
              //                               DateFormat('yyyy-MM-dd HH:mm:ss')
              //                                   .format(initialEnd);

              //                           showModalBottomSheet(
              //                               context: context,
              //                               builder: (BuildContext context) {
              //                                 return BottomSheetShow(
              //                                   cancelOnPressed: () {
              //                                     Navigator.pop(context);
              //                                     controller.offlineMeetingEnd
              //                                         .value = '';
              //                                   },
              //                                   choiceOnPressed: () {
              //                                     Navigator.pop(context);
              //                                   },
              //                                   onDateTimeChanged: (v) {
              //                                     controller.offlineMeetingEnd
              //                                         .value = DateFormat(
              //                                             'yyyy-MM-dd HH:mm:ss')
              //                                         .format(v);
              //                                   },
              //                                   initialDateTime: initialEnd,
              //                                   minuteInterval: 10,
              //                                   minimumDate: DateFormat(
              //                                           'yyyy-MM-dd HH:mm:ss')
              //                                       .parse(controller
              //                                           .offlineMeetingStart
              //                                           .value),
              //                                   maximumDate: DateFormat(
              //                                           'yyyy-MM-dd HH:mm:ss')
              //                                       .parse(DateTime(
              //                                     currentNow.year,
              //                                     currentNow.month,
              //                                     currentNow.day + 31,
              //                                   ).toString()),
              //                                 );
              //                               });
              //                         },
              //               child: Text(
              //                 '종료',
              //                 style: TextStyle(
              //                   fontSize: Get.width * 0.045,
              //                   decoration: TextDecoration.underline,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Spacer(flex: 1),
              //           TextButton(
              //             onPressed: () {
              //               controller.offlineMeetingStart.value = '';
              //               controller.offlineMeetingEnd.value = '';
              //             },
              //             child: Text(
              //               '리셋',
              //               style: TextStyle(
              //                 fontSize: Get.width * 0.045,
              //                 color: AppColor.primary,
              //                 decoration: TextDecoration.underline,
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // Divider(color: AppColor.dark_grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.image_outlined,
                        size: Get.width * 0.045,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '방 사진(선택)',
                        style: TextStyle(
                            fontSize: Get.width * 0.045,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                          onTap: () {
                            controller.galleryImage();
                          },
                          child: GetBuilder<ChatCreateController>(
                            init: ChatCreateController(),
                            builder: (value) => value.profileFile == null
                                ? AspectRatio(
                                    aspectRatio: 1.77,
                                    child: Container(
                                        height: Get.height * 0.1,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.extra_light_grey,
                                              width: 3.0),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color:
                                              AppColor.extra_extra_light_grey,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.image_search,
                                            color: AppColor.light_grey,
                                            size: Get.height * 0.04,
                                          ),
                                        )),
                                  )
                                : Badge(
                                    badgeColor: AppColor.primary,
                                    //padding: const EdgeInsets.all(0.0),
                                    //stackFit: StackFit.expand,
                                    badgeContent: GestureDetector(
                                      onTap: value.imageDelete,
                                      child: Icon(
                                        Icons.close,
                                        size: 25,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1.77,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.file(
                                          value.profileFile!,
                                          fit: BoxFit.fill,
                                          height: Get.height * 0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
