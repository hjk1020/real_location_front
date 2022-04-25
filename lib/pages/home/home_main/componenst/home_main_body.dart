import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:real_app_2/bindings/room_profile.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:real_app_2/components/black_progress_indicator.dart';
import 'package:real_app_2/controllers/home_controller.dart';
import 'package:real_app_2/models/room_list_items.dart';
import 'package:real_app_2/pages/chat/room_profile/room_profile.dart';
import 'package:real_app_2/pages/home/home_main/componenst/home_sliver_app_bar.dart';
import 'package:real_app_2/theme/theme.dart';

// class HomeMainBody extends StatelessWidget {
//   const HomeMainBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put<HomeController>(HomeController());
//     return PagedListView.separated(
//       pagingController: controller.pagingController,
//       separatorBuilder: (context, index) => const Divider(),
//       builderDelegate: PagedChildBuilderDelegate(
//         itemBuilder: (context, item, index) {
//           return TestListTile(items: item);
//         },
//       ),
//     );
//   }
// }

// class HomeMainBody extends StatelessWidget {
//   const HomeMainBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put<HomeController>(HomeController());

//     return SafeArea(
//       child: Obx(() => RefreshIndicator(
//          onRefresh: () async {
//                 controller.refresh();
//               },
//         child: SingleChildScrollView(
//               controller: controller.scrollController,
//               physics: const ClampingScrollPhysics(),
//               child: ListView.separated(
//                 physics: const ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: ((context, index) {
//                   return ListTile(
//                     leading: Text('$index'),
//                     title: Text(controller.defaultRoomList.value[index].title),
//                     subtitle: Text(
//                         controller.defaultRoomList.value[index].locationTitle),
//                   );
//                 }),
//                 separatorBuilder: (c, i) => Divider(),
//                 itemCount: controller.defaultRoomList.length,
//               ),
//             ),
//       )),
//     );
//   }
// }
// class HomeMainBody extends StatelessWidget {
//   const HomeMainBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put<HomeController>(HomeController());
//     return Obx(() => SmartRefresher(
//           enablePullDown: true,
//           enablePullUp: true,
//           physics: ClampingScrollPhysics(),
//           controller: controller.refreshController,
//           onRefresh: controller.onRefresh,
//           onLoading: controller.onLoading,
//           child: ListView.builder(
//               itemCount: controller.defaultRoomList.length,
//               itemBuilder: (c, i) {
//                 return ListTile(
//                   leading: Text('$i'),
//                   title: Text(controller.defaultRoomList.value[i].title),
//                 );
//               }),
//         ));
//   }
// }

class HomeMainBody extends StatelessWidget {
  const HomeMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomeController>(HomeController());

    return Obx(() => RefreshIndicator(
          onRefresh: controller.refresh,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: controller.scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  //controller.
                  // Container(
                  //   height: 100.0,
                  //   width: double.infinity,
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  //   decoration: BoxDecoration(
                  //     border:
                  //         Border.all(width: 1.0, color: AppColor.extra_light_grey),
                  //     borderRadius: BorderRadius.circular(20.0),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       '지역 광고 입니다.',
                  //       style: TextStyle(fontSize: 30),
                  //     ),
                  //   ),
                  // ),

                  ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.defaultRoomList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => RoomProfile(),
                                binding: RoomProfileBinding(),
                                arguments: {
                                  'id':
                                      controller.defaultRoomList.value[index].id
                                });
                          },
                          child: RoomCard(
                            image: controller
                                .defaultRoomList.value[index].bangjangThumbnail,
                            name: controller
                                .defaultRoomList.value[index].bangjangName,
                            chipChildren: [
                              MiniChip(
                                color: AppColor.dark_grey,
                                text: controller.defaultRoomList.value[index]
                                    .subInteresting,
                              ),
                              MiniChip(
                                color: Colors.brown,
                                text:
                                    '${controller.defaultRoomList.value[index].minAge}~${controller.defaultRoomList.value[index].maxAge}대',
                              ),
                              if (controller
                                      .defaultRoomList.value[index].gender !=
                                  'UNKNOWN')
                                MiniChip(
                                  color: controller.defaultRoomList.value[index]
                                              .gender ==
                                          'MALE'
                                      ? Colors.blue
                                      : Colors.red,
                                  text: controller.defaultRoomList.value[index]
                                              .gender ==
                                          'MALE'
                                      ? '남성'
                                      : '여성',
                                ),
                            ],
                            pop:
                                '${controller.defaultRoomList.value[index].memberCount}/${controller.defaultRoomList.value[index].pop}',
                            title:
                                controller.defaultRoomList.value[index].title,
                            address:
                                '${controller.defaultRoomList.value[index].locationTitle} D - ${controller.defaultRoomList.value[index].expireRoomDate}',
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}

class RoomCard extends StatelessWidget {
  final image;
  final name;
  final chipChildren;
  final pop;
  final title;
  final address;

  const RoomCard({
    Key? key,
    this.image,
    this.name,
    this.chipChildren,
    this.pop,
    this.title,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: AppColor.extra_light_grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(image),
                  ),
                  Text(
                    name,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: chipChildren,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.emoji_people,
                              size: 15,
                              color: AppColor.dark_grey,
                            ),
                            Text(
                              pop,
                              style: const TextStyle(
                                fontSize: 15,
                                color: AppColor.dark_grey,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        title,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 15.0,
                            color: AppColor.light_grey,
                          ),
                        ),
                        Text(
                          address,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: AppColor.light_grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniChip extends StatelessWidget {
  final text;
  final color;

  const MiniChip({
    Key? key,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        alignment: Alignment.center,
        height: 22,
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11.0,
            color: color,
          ),
        ),
      ),
    );
  }
}

// class HomeMainBody extends StatelessWidget {
//   HomeMainBody({Key? key}) : super(key: key);

//   //ScrollController _controller = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.put(HomeController());

//     return Obx(() => SmartRefresher(
//           controller: controller.refreshController,
//           enablePullUp: true,
//           enablePullDown: true,
//           onLoading: () async {
//             await controller.fetchItems(controller.mainPage.value);
//             controller.refreshController.loadComplete();
//             print('onLoading');
//           },
//           onRefresh: () async {
//             await controller.fetchItems(controller.mainPage.value);
//             controller.refreshController.refreshCompleted();

//             print('refresh');
//           },
//           child: SingleChildScrollView(
//             //controller: _controller,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(children: [
//                 if (controller.isLoading.value && controller.test.length == 0)
//                   Center(
//                     child: BlackProgressIndicator(),
//                   ),
//                 if (controller.isLoading.value == false &&
//                     controller.test.length == 0)
//                   Center(child: Text('아이템 없음')),
//                 SizedBox(
//                   child: ListView.builder(
//                     physics: const ClampingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: controller.test.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: Get.height * 0.1,
//                         decoration: BoxDecoration(
//                             border:
//                                 Border.all(color: Colors.black, width: 1.0)),
//                         child: Text(
//                           '${controller.test.value[index]}',
//                         ),
//                       );

//                       // if (controller.isLoading.value == false &&
//                       //     controller.lastPage.value == false) {
//                       //   Future.microtask(() {
//                       //     controller.fetchItems(controller.mainPage.value);
//                       //   });
//                       //   print(controller.mainPage.value);
//                       // }

//                       // if (controller.lastPage.value == false) {
//                       //   return Center(
//                       //     child: BlackProgressIndicator(),
//                       //   );
//                       // } else {
//                       //   return Center(
//                       //     child: Text('더이상 아이템 없음'),
//                       //   );
//                       // }
//                     },
//                   ),
//                 )
//               ]),
//             ),
//           ),
//         ));
//   }
// }
