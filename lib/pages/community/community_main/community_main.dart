import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_app_2/pages/community/community_main/components/community_main_body.dart';

class CommunityMain extends StatelessWidget {
  const CommunityMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '번개모임',
            style: TextStyle(fontFamily: "Bmhanna"),
          ),
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 20.0),
          //   child: Center(
          //       child: Icon(
          //     Icons.add_reaction,
          //     size: Get.height * 0.04,
          //   )),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
                size: Get.height * 0.03,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.notifications_none,
                size: Get.height * 0.03,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.portrait,
                size: Get.height * 0.03,
              ),
            )
          ]),
      body: CommunityMainBody(),
    );
  }
}
