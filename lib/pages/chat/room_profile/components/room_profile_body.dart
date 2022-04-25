import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/controllers/room_profile_controller.dart';
import 'package:real_app_2/theme/theme.dart';

class RoomProfileBody extends StatelessWidget {
  const RoomProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<RoomProfileController>(RoomProfileController());
    // final bangjang = controller.roomProfileMember.value
    //     .where((data) => data.userType == 'bangjang')
    //     .toList();
    // final member = controller.roomProfileMember
    //     .where((data) => data.userType != 'bangjang')
    //     .toList();
    //  var bj = controller.roomMemberBangjang();

    return Obx(() => controller.isLoading.value == true
        ? const Center(child: BlackProgressIndicator())
        : SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(children: [
                GestureDetector(
                  onTap: () {},
                  child: ExtendedImage.network(
                    controller.roomProfile.value.roomThumbnail,
                    width: double.infinity,
                    height: Get.height * 0.2,
                    fit: BoxFit.fill,
                    cacheMaxAge: Duration(days: 20),
                    loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.failed:
                          Image.asset('/assets/images/room1.jpeg');
                          break;
                        case LoadState.loading:
                          // TODO: Handle this case.
                          break;
                        case LoadState.completed:
                          // TODO: Handle this case.
                          break;
                      }
                    },
                    cache: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TopChip(
                              text: controller.roomProfile.value.subInteresting,
                              color: AppColor.dark_grey),
                          TopChip(
                            text: controller.roomProfile.value.age,
                            color: Colors.brown,
                          ),
                          if (controller.roomProfile.value.gender == 'FEMALE')
                            const TopChip(
                              text: '여성',
                              color: Colors.red,
                            ),
                          if (controller.roomProfile.value.gender == 'MALE')
                            const TopChip(
                              text: '남성',
                              color: Colors.blue,
                            )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          controller.roomProfile.value.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.schedule_rounded,
                                size: 15.0, color: AppColor.dark_grey),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                controller.roomProfile.value.locationTitle,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.dark_grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Text(
                        controller.roomProfile.value.description,
                        //'😀 20~30대 여성들만 이용하는 등산 모임 방입니다.\n\n😀 채팅에는 주기적으로 참여하셔야 하며 채팅 미참여시 추방됩니다.유령회원 감시합니다.\n\n😀 회비는 기본적으로 5천원 입니다.\n\n😀 일회성 모임이며 모임을 더 가지고 싶으신 분은 모임이 끝난후 비밀모임방을 만들어 초대해 주세요.',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: Get.height * 0.05),
                      Text(
                        '모임 멤버 (${controller.roomProfileMember.length}/${controller.roomProfile.value.pop})',
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.roomMemberBangjang().length,
                          itemBuilder: (context, index) {
                            return BangjangTemp(
                              url: controller
                                  .roomMemberBangjang()[index]
                                  .userThumbnail,
                              name: controller
                                  .roomMemberBangjang()[index]
                                  .username,
                              gender: controller
                                  .roomMemberBangjang()[index]
                                  .userGender,
                              intro: controller
                                      .roomMemberBangjang()[index]
                                      .selfMessage ??
                                  '',
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.roomMemberUser().length,
                          itemBuilder: (context, index) {
                            return MemberTemp(
                              url: controller
                                  .roomMemberUser()[index]
                                  .userThumbnail,
                              name: controller.roomMemberUser()[index].username,
                              gender:
                                  controller.roomMemberUser()[index].userGender,
                              descript: controller
                                      .roomMemberUser()[index]
                                      .selfMessage ??
                                  '',
                            );
                          })
                    ],
                  ),
                )
              ]),
            ),
          ));
  }
}

class BangjangTemp extends StatelessWidget {
  final url;
  final name;
  final intro;
  final gender;
  const BangjangTemp({
    Key? key,
    this.url,
    this.name,
    this.intro,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child: Image.asset(
          //     url,
          //     width: 45,
          //     height: 45,
          //   ),
          // ),
          ExtendedImage.network(
            url,
            width: 45,
            height: 45,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: gender == 'MALE'
                  ? Colors.blue
                  : gender == 'FEMALE'
                      ? Colors.red
                      : AppColor.light_grey,
              width: 2.0,
            ),
            cacheMaxAge: Duration(days: 20),
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.failed:
                  Image.asset('/assets/images/dog.jpeg');
                  break;
                case LoadState.loading:
                  // TODO: Handle this case.
                  break;
                case LoadState.completed:
                  // TODO: Handle this case.
                  break;
              }
            },
            cache: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        '🌟 방장',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
                Text(
                  intro,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MemberTemp extends StatelessWidget {
  final url;
  final name;
  final descript;
  final gender;

  const MemberTemp({
    Key? key,
    this.name,
    this.descript,
    this.url,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ExtendedImage.network(
            url,
            width: 45,
            height: 45,
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: gender == 'MALE'
                  ? Colors.blue
                  : gender == 'FEMALE'
                      ? Colors.red
                      : AppColor.light_grey,
              width: 2.0,
            ),
            cacheMaxAge: const Duration(days: 20),
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.failed:
                  Image.asset('/assets/images/dog.jpeg');
                  break;
                case LoadState.loading:
                  // TODO: Handle this case.
                  break;
                case LoadState.completed:
                  // TODO: Handle this case.
                  break;
              }
            },
            cache: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  descript,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopChip extends StatelessWidget {
  final text;
  final color;

  const TopChip({
    Key? key,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Chip(
        label: Text(text),
        labelStyle: TextStyle(color: color),
        side: BorderSide(color: color),
        backgroundColor: AppColor.white,
      ),
    );
  }
}
