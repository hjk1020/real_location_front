import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/components/linear_textfield.dart';
import 'package:real_app_2/controllers/chat_create_controller.dart';
import 'package:real_app_2/theme/theme.dart';

// class ChatCreateLocationDongBody extends GetView<ChatCreateController> {
//   const ChatCreateLocationDongBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: SizedBox(
//                     height: Get.height * 0.05,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: controller.dong.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 10.0),
//                           child: InkWell(
//                             onTap: () {
//                               controller.dongChipClick(index);
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(10.0),
//                               height: Get.height * 0.04,
//                               decoration: BoxDecoration(
//                                 color: AppColor.primary,
//                                 borderRadius: BorderRadius.circular(20.0),
//                                 // border: Border.all(
//                                 //     color: AppColor.primary, width: 3.0),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   '${controller.dong.value[index]}',
//                                   style: TextStyle(
//                                       color: AppColor.white,
//                                       fontSize: Get.width * 0.045,
//                                       fontWeight: FontWeight.w800),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 10,
//                       child: LinearTextField(
//                         hint: '행정동 검색',
//                         onChanged: (v) {
//                           controller.dongLocationQuery.value = v;
//                         },
//                       ),
//                     ),
//                     const Spacer(flex: 1),
//                     Expanded(
//                       flex: 1,
//                       child: IconButton(
//                         onPressed: () {
//                           controller.myLocationDataSearch();
//                         },
//                         icon: const Icon(Icons.my_location),
//                       ),
//                     )
//                   ],
//                 ),
//                 if (controller.dongSearchList.isEmpty &&
//                     controller.isLoading.value == false)
//                   SizedBox(
//                     height: Get.height * 0.6,
//                     child: Center(
//                       child: Text(
//                         '검색결과가 없습니다.',
//                         style: TextStyle(
//                           color: AppColor.dark_grey,
//                           fontSize: Get.width * 0.05,
//                         ),
//                       ),
//                     ),
//                   ),
//                 if (controller.isLoading.value == true &&
//                     controller.dongSearchList.isEmpty)
//                   SizedBox(
//                     height: Get.height * 0.6,
//                     child: const Center(
//                       child: BlackProgressIndicator(),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

class ChatCreateLocationDongBody extends StatefulWidget {
  const ChatCreateLocationDongBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatCreateLocationDongBody> createState() =>
      _ChatCreateLocationDongBodyState();
}

class _ChatCreateLocationDongBodyState
    extends State<ChatCreateLocationDongBody> {
  @override
  Widget build(BuildContext context) {
    final ChatCreateController controller = Get.put(ChatCreateController());

    int? _selectedIndex;

    return Obx(() => SingleChildScrollView(
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: Get.height * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.dong.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dong = controller
                            .myMainLocation.value[index].locationName
                            .split(' ')
                            .last;
                        print(dong);
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: InkWell(
                            onTap: () {
                              controller.dongChipClick(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(9.0),
                              height: Get.height * 0.04,
                              decoration: BoxDecoration(
                                //color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: AppColor.primary, width: 3.0),
                              ),
                              child: Center(
                                child: Text(
                                  '${controller.dong.value[index]}',
                                  style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: Get.width * 0.04,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: LinearTextField(
                        hint: '법정동 검색',
                        onChanged: (v) {
                          controller.dongLocationQuery.value = v;
                        },
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          controller.myLocationDataSearch();
                        },
                        icon: const Icon(Icons.my_location),
                      ),
                    )
                  ],
                ),
                if (controller.dongSearchList.isEmpty &&
                    controller.isLoading.value == false)
                  SizedBox(
                    height: Get.height * 0.6,
                    child: Center(
                      child: Text(
                        '검색결과가 없습니다.',
                        style: TextStyle(
                          color: AppColor.dark_grey,
                          fontSize: Get.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                if (controller.isLoading.value == true &&
                    controller.dongSearchList.isEmpty)
                  SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                      child: BlackProgressIndicator(),
                    ),
                  ),
                if (controller.dongSearchList.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.dongSearchList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < controller.dongSearchList.length) {
                        return Container(
                          height: Get.height * 0.07,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColor.extra_light_grey,
                              ),
                            ),
                          ),
                          child: ListTile(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {
                                _selectedIndex = index;
                              });
                              controller.dongOnSelect(index);
                            },
                            title: Text(
                              controller.dongSearchList.value[index].documents
                                  .address.addressName,
                              style: _selectedIndex != index ||
                                      _selectedIndex == null
                                  ? const TextStyle(color: AppColor.primary)
                                  : const TextStyle(
                                      color: Colors.red,
                                    ),
                            ),
                          ),
                        );
                      }
                      if (controller.isLoading.value == true &&
                          controller.dongLastPage.value == false) {
                        return SizedBox(
                          height: Get.height * 0.1,
                          child: const Center(
                            child: BlackProgressIndicator(),
                          ),
                        );
                      }
                      if (controller.isLoading.value == false &&
                          controller.dongLastPage.value == true) {
                        return SizedBox(
                            height: Get.height * 0.1,
                            child: const Center(child: Text('마지막입니다.')));
                      }
                      return Container(
                        height: Get.height * 0.1,
                      );
                    },
                  )
              ],
            ),
          ),
        ));
  }
}
