import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:real_app_2/components/sliver_appbar_delegate.dart';
import 'package:real_app_2/controllers/profile_controller.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/community_tab.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/follow_column.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/profile_grey_container.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/read_more.dart';
import 'package:real_app_2/theme/theme.dart';

class ProfileMainBody extends GetView<ProfileController> {
  const ProfileMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          'assets/images/dog.jpeg',
                          fit: BoxFit.fill,
                          width: Get.height * 0.1,
                          height: Get.height * 0.1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          '_mina',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            FollowColumn(
                              onTap: () {},
                              count: '0',
                              follow: '팔로워',
                            ),
                            FollowColumn(
                              onTap: () {},
                              count: '29',
                              follow: '팔로잉',
                            ),
                            FollowColumn(
                              onTap: () {},
                              count: '30',
                              follow: '좋아요',
                            ),
                          ],
                        ),
                      ),
                      ReadMore(
                        text: '안녕하세요. 반갑습니다\n\n ㅎㅎㅎ',
                      ),
                      Text(
                        'www.naver.com',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Wrap(
                          //spacing: -15.0,
                          runSpacing: -15.0,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          // alignment: WrapAlignment.spaceAround,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Transform(
                              transform: Matrix4.identity()..scale(0.8),
                              child: Chip(
                                label: Text('자전거'),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.identity()..scale(0.8),
                              child: Chip(
                                label: Text('축구'),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.identity()..scale(0.8),
                              child: Chip(
                                label: Text('독서'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                        child: Row(
                          children: [
                            ProfileGreyContainer(
                              onTap: () {},
                              flex: 25,
                              child: Text('팔로우'),
                            ),
                            Spacer(flex: 1),
                            ProfileGreyContainer(
                              onTap: () {},
                              flex: 25,
                              child: Text('메세지'),
                            ),
                            Spacer(flex: 1),
                            ProfileGreyContainer(
                              onTap: () {},
                              flex: 6,
                              child: Icon(Icons.favorite_border),
                            ),
                            Spacer(flex: 1),
                            ProfileGreyContainer(
                              onTap: () {},
                              flex: 6,
                              child: FaIcon(FontAwesomeIcons.instagram),
                            ),
                            Spacer(flex: 1),
                            ProfileGreyContainer(
                              onTap: () {},
                              flex: 6,
                              child: Icon(Icons.arrow_drop_down_outlined),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                elevation: 0.0,
                //expandedHeight: Get.height * 0.05,
                //stretchTriggerOffset: 1,
                flexibleSpace: Container(
                  height: Get.height * 0.07,
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                          width: 1.0, color: AppColor.extra_extra_light_grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommunityTab(
                        onPressed: () {
                          controller.tabBool.value = true;
                          print(controller.tabBool.value);
                        },
                        text: '사진',
                        color: controller.tabBool.value
                            ? Colors.black
                            : AppColor.light_grey,
                      ),
                      CommunityTab(
                        onPressed: () {
                          controller.tabBool.value = false;
                          print(controller.tabBool.value);
                        },
                        text: '커뮤니티',
                        color: controller.tabBool.value
                            ? AppColor.light_grey
                            : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Center(
                    child: Text(
                  '사진이 없습니다.',
                  style: TextStyle(
                    color: AppColor.light_grey,
                    fontSize: Get.width * 0.045,
                  ),
                )),
              )
            ],
          ),
        ));
  }
}

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;
//   final double max;
//   final double min;

//   _SliverAppBarDelegate({
//     required this.max,
//     required this.min,
//     required this.child,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // TODO: implement build
//     return child;
//   }

//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => max;

//   @override
//   // TODO: implement minExtent
//   double get minExtent => min;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     // TODO: implement shouldRebuild
//     return true;
//   }
// }

//  Container(
//                     height: Get.height * 0.05,
//                     decoration: BoxDecoration(
//                       border: Border.symmetric(
//                         horizontal: BorderSide(
//                             width: 1.0, color: AppColor.extra_extra_light_grey),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         CommunityTab(
//                           onPressed: () {
//                             controller.tabBool.value = true;
//                             print(controller.tabBool.value);
//                           },
//                           text: '커뮤니티',
//                           color: controller.tabBool.value
//                               ? Colors.black
//                               : AppColor.light_grey,
//                         ),
//                         CommunityTab(
//                           onPressed: () {
//                             controller.tabBool.value = false;
//                             print(controller.tabBool.value);
//                           },
//                           text: '참여한 방',
//                           color: controller.tabBool.value
//                               ? AppColor.light_grey
//                               : Colors.black,
//                         ),
//                       ],
//                     ),
//                   ),
