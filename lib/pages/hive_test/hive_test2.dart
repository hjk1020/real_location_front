// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:real_app_2/controllers/hive_test_controller.dart';

// class HiveTest2 extends GetView<HiveTestController> {
//   const HiveTest2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('테스트 추가'),
//         actions: [
//           IconButton(
//               onPressed: controller.inputFriends, icon: Icon(Icons.check))
//         ],
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           TextField(
//             onChanged: (v) {
//               controller.name.value = v;
              
//             },
//             decoration: InputDecoration(labelText: '이름'),
//           ),
//           TextField(
//             onChanged: (v) {
//               controller.friedsString.value = v;
//             },
//             decoration: InputDecoration(labelText: '친구'),
//           )
//         ],
//       )),
//     );
//   }
// }
