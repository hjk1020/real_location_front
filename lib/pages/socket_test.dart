import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_app_2/components/linear_textfield.dart';
import 'package:real_app_2/controllers/socket_test_controller.dart';

class SocketTest extends StatelessWidget {
  const SocketTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SocketTestController controller = Get.put(SocketTestController());

    return Scaffold(
        appBar: AppBar(
          title: Text('테스트'),
        ),
        body: Obx(
          () => SafeArea(
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.1,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9,
                          child: TextField(
                            onChanged: (v) {
                              controller.sub.value = v;
                            },
                          )),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {
                              controller.msgEmitted(controller.sub.value);
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    TextButton(
                        onPressed: () {
                          controller.onDisConnected();
                        },
                        child: Text('연결해제')),
                    TextButton(
                        onPressed: () {
                          controller.dioTest();
                          // controller.hivetest();
                          // controller.onConnected();
                        },
                        child: Text('연결')),
                    ListView.builder(
                      itemCount: controller.msgList.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Container(
                            height: Get.height * 0.1,
                            color: Colors.amber,
                            child: Text('${controller.msgList.value[index]}'));
                      }),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ));
  }
}
