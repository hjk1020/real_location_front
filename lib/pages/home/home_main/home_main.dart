import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:real_app_2/pages/home/home_main/componenst/home_floating_button.dart';
import 'package:real_app_2/pages/home/home_main/componenst/home_main_body.dart';
import 'package:real_app_2/theme/theme.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Padding(
          //     padding:
          //         const EdgeInsets.only(left: 20.0, bottom: 10.0, top: 10.0),
          //     child: Container(
          //       width: 10,
          //       height: 10,
          //       decoration: BoxDecoration(
          //           color: Colors.black,
          //           borderRadius: BorderRadius.circular(10)),
          //     )
          // Center(
          //     child: Icon(
          //   Icons.add_reaction,
          //   size: Get.height * 0.04,
          // )),
          // ),
          title: Text(
            '번개모임',
            style: TextStyle(fontFamily: "Bmhanna"
                // color: AppColor.white,
                ),
          ),
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
            ),
          ]),
      body: HomeMainBody(),
      floatingActionButton: const HomeFloatingButton(),
    );
  }
}
