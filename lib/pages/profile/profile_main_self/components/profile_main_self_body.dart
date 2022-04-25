import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:real_app_2/controllers/profile_controller.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/community_tab.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/follow_column.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/profile_grey_container.dart';
import 'package:real_app_2/pages/profile/profile_main_self/components/read_more.dart';
import 'package:real_app_2/theme/theme.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ProfileMainSelfBody extends StatelessWidget {
  const ProfileMainSelfBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * 0.1,
                  width: Get.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: AppColor.light_grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '사용자 이름',
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
                  text: 'sdfasfsafasf',
                ),
                Text(
                  '홈페이지 들어갈 호ㅓㅣㅏㅁ뉘.',
                  style: TextStyle(color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Wrap(
                    spacing: -15.0,
                    runSpacing: -15.0,
                    //crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.identity()..scale(0.65),
                        child: Chip(
                          label: Text('gkgsdfsfgk'),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.identity()..scale(0.65),
                        child: Chip(
                          label: Text('gkgkgk'),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.identity()..scale(0.65),
                        child: Chip(
                          label: Text('gkgkgk'),
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
                        flex: 20,
                        onTap: () {},
                        child: Text('프로필 변경'),
                      ),
                      Spacer(flex: 1),
                      ProfileGreyContainer(
                        flex: 2,
                        onTap: () {},
                        child: Icon(Icons.arrow_drop_down_outlined),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
              ],
            ),
          ),
        ),
        SliverStickyHeader(
            // overlapHeaders: false,
            header: Container(
              height: Get.height * 0.06,
              color: AppColor.white,
              child: TabBar(
                indicatorColor: Colors.black,
                // indicatorSize: Get.height * 0.08,
                controller: controller.tabController,
                tabs: [
                  Icon(
                    Icons.photo_library_outlined,
                    color: Colors.black,
                  ),
                  Icon(
                    Icons.people_alt_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            sliver: SliverFillRemaining(
              child: Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Text(
                        '안녕',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                        height: 50,
                        child: Text('안녕', style: TextStyle(color: Colors.red))),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

// class ProfileMainSelfBody extends StatelessWidget {
//   const ProfileMainSelfBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ProfileController controller = Get.put(ProfileController());

//     return DefaultTabController(
//       length: 2,
//       child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 expandedHeight: Get.height * 0.5,
//                 flexibleSpace: FlexibleSpaceBar(
//                     collapseMode: CollapseMode.pin,
//                     background: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: Get.height * 0.1,
//                               width: Get.height * 0.1,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100.0),
//                                   color: AppColor.light_grey),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 10.0),
//                               child: Text(
//                                 '사용자 이름',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 10.0),
//                               child: Row(
//                                 children: [
//                                   FollowColumn(
//                                     onTap: () {},
//                                     count: '0',
//                                     follow: '팔로워',
//                                   ),
//                                   FollowColumn(
//                                     onTap: () {},
//                                     count: '29',
//                                     follow: '팔로잉',
//                                   ),
//                                   FollowColumn(
//                                     onTap: () {},
//                                     count: '30',
//                                     follow: '좋아요',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             ReadMore(
//                               text: 'sdfasfsafasf',
//                             ),
//                             Text(
//                               '홈페이지 들어갈 호ㅓㅣㅏㅁ뉘.',
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 10.0),
//                               child: Wrap(
//                                 spacing: -15.0,
//                                 runSpacing: -15.0,
//                                 //crossAxisAlignment: WrapCrossAlignment.center,
//                                 children: [
//                                   Transform(
//                                     transform: Matrix4.identity()..scale(0.65),
//                                     child: Chip(
//                                       label: Text('gkgsdfsfgk'),
//                                     ),
//                                   ),
//                                   Transform(
//                                     transform: Matrix4.identity()..scale(0.65),
//                                     child: Chip(
//                                       label: Text('gkgkgk'),
//                                     ),
//                                   ),
//                                   Transform(
//                                     transform: Matrix4.identity()..scale(0.65),
//                                     child: Chip(
//                                       label: Text('gkgkgk'),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: Get.height * 0.04,
//                               child: Row(
//                                 children: [
//                                   ProfileGreyContainer(
//                                     flex: 20,
//                                     onTap: () {},
//                                     child: Text('프로필 변경'),
//                                   ),
//                                   Spacer(flex: 1),
//                                   ProfileGreyContainer(
//                                     flex: 2,
//                                     onTap: () {},
//                                     child: Icon(Icons.arrow_drop_down_outlined),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
//                 pinned: true,
//                 floating: true,
//                 bottom: TabBar(
//                   tabs: [
//                     Tab(child: Text('사진')),
//                     Tab(child: Text('커뮤니티')),
//                   ],
//                 ),
//               )
//             ];
//           },
//           body: TabBarView(
//             children: [
//               Icon(Icons.directions_transit, size: 350),
//               Icon(Icons.directions_car, size: 350),
//             ],
//           )),
//     );
//   }
// }

// class ProfileMainSelfBody extends StatelessWidget {
//   const ProfileMainSelfBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ProfileController controller = Get.put(ProfileController());

//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: 
// Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: Get.height * 0.1,
//                     width: Get.height * 0.1,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100.0),
//                         color: AppColor.light_grey),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Text(
//                       '사용자 이름',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Row(
//                       children: [
//                         FollowColumn(
//                           onTap: () {},
//                           count: '0',
//                           follow: '팔로워',
//                         ),
//                         FollowColumn(
//                           onTap: () {},
//                           count: '29',
//                           follow: '팔로잉',
//                         ),
//                         FollowColumn(
//                           onTap: () {},
//                           count: '30',
//                           follow: '좋아요',
//                         ),
//                       ],
//                     ),
//                   ),
//                   ReadMore(
//                     text: 'sdfasfsafasf',
//                   ),
//                   Text(
//                     '홈페이지 들어갈 호ㅓㅣㅏㅁ뉘.',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Wrap(
//                       spacing: -15.0,
//                       runSpacing: -15.0,
//                       //crossAxisAlignment: WrapCrossAlignment.center,
//                       children: [
//                         Transform(
//                           transform: Matrix4.identity()..scale(0.65),
//                           child: Chip(
//                             label: Text('gkgsdfsfgk'),
//                           ),
//                         ),
//                         Transform(
//                           transform: Matrix4.identity()..scale(0.65),
//                           child: Chip(
//                             label: Text('gkgkgk'),
//                           ),
//                         ),
//                         Transform(
//                           transform: Matrix4.identity()..scale(0.65),
//                           child: Chip(
//                             label: Text('gkgkgk'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.04,
//                     child: Row(
//                       children: [
//                         ProfileGreyContainer(
//                           flex: 20,
//                           onTap: () {},
//                           child: Text('프로필 변경'),
//                         ),
//                         Spacer(flex: 1),
//                         ProfileGreyContainer(
//                           flex: 2,
//                           onTap: () {},
//                           child: Icon(Icons.arrow_drop_down_outlined),
//                         )
//                       ],
//                     ),
//                   ),
//                   SliverAppBar(
//                     pinned: true,
//                     automaticallyImplyLeading: false,
//                     elevation: 0.0,
//                     flexibleSpace: Container(
//                       height: Get.height * 0.05,
//                       decoration: BoxDecoration(
//                         border: Border.symmetric(
//                           horizontal: BorderSide(
//                               width: 1.0,
//                               color: AppColor.extra_extra_light_grey),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           CommunityTab(
//                             onPressed: () {
//                               controller.tabBool.value = true;
//                             },
//                             text: '커뮤니티',
//                             color: controller.tabBool.value
//                                 ? Colors.black
//                                 : AppColor.light_grey,
//                           ),
//                           CommunityTab(
//                             onPressed: () {
//                               controller.tabBool.value = false;
//                             },
//                             text: '참여한 방',
//                             color: controller.tabBool.value
//                                 ? AppColor.light_grey
//                                 : Colors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
