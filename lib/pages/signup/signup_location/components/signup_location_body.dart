import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/components/linear_textfield.dart';
import 'package:real_app_2/components/sliver_appbar_delegate.dart';
import 'package:real_app_2/controllers/signup_controller.dart';
import 'package:real_app_2/theme/theme.dart';

class SignupLocationBody extends StatefulWidget {
  const SignupLocationBody({Key? key}) : super(key: key);

  @override
  State<SignupLocationBody> createState() => _SignupLocationBodyState();
}

class _SignupLocationBodyState extends State<SignupLocationBody> {
  final SignupController controller = Get.put(SignupController());

  int? _selectedIndex;
  bool _selfLocationBool = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            controller: controller.scrollController.value,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 22,
                        child: LinearTextField(
                          controller: controller.textEditingController,
                          hint: '읍, 면, 동을 입력하세요.',
                          hintFontSize: Get.width * 0.045,
                          onChanged: (v) {
                            controller.locationQuery.value = v;
                          },
                          suffixIcon: controller.locationQuery.isEmpty
                              ? null
                              : IconButton(
                                  onPressed: controller.queryClear,
                                  icon: const Icon(Icons.clear),
                                ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 3,
                        child: IconButton(
                          onPressed: controller.myLocationDataSearch,
                          icon: const Icon(Icons.my_location),
                        ),
                      )
                    ],
                  ),
                ),
                if (controller.locationList.isEmpty &&
                    controller.myLocationSearchList.isEmpty &&
                    controller.isLoading.value == false)
                  SingleChildScrollView(
                    child: SizedBox(
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
                  ),
                if (controller.isLoading.value == true &&
                    controller.locationList.isEmpty &&
                    controller.myLocationSearchList.isEmpty)
                  SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(
                      child: BlackProgressIndicator(),
                    ),
                  ),
                if (controller.myLocationSearchList.isNotEmpty &&
                    controller.locationList.isEmpty)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selfLocationBool
                            ? _selfLocationBool = false
                            : _selfLocationBool = true;
                      });
                      if (_selfLocationBool) {
                        controller.selectedMyLocationTrue();
                      } else {
                        controller.selectedMyLocationFalse();
                      }
                    },
                    child: ListTile(
                      title: Text(
                        controller.selfLocationName.value,
                        style: _selfLocationBool
                            ? TextStyle(color: Colors.red)
                            : TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                if (controller.locationList.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.locationList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < controller.locationList.length) {
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
                              controller.onSelected(index);
                            },
                            title: Text(
                              controller.locationList.value[index].documents.address.addressName,
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
                          controller.lastpage.value == false) {
                        return SizedBox(
                          height: Get.height * 0.1,
                          child: const Center(
                            child: BlackProgressIndicator(),
                          ),
                        );
                      }
                      if (controller.isLoading.value == false &&
                          controller.lastpage.value == true) {
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
        ),
      ),
    );
  }
}
