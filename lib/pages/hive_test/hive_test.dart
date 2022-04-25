// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:real_app_2/bindings/hive_test_binding.dart';
// import 'package:real_app_2/controllers/hive_test_controller.dart';
// import 'package:real_app_2/models/hive/test.dart';
// import 'package:real_app_2/pages/hive_test/hive_test2.dart';

// class Hive_Test extends StatefulWidget {
//   const Hive_Test({Key? key}) : super(key: key);

//   @override
//   State<Hive_Test> createState() => _Hive_TestState();
// }

// class _Hive_TestState extends State<Hive_Test> {
//   @override
//   Widget build(BuildContext context) {
//     // final HiveTestController controller = Get.put(HiveTestController());

//     return Scaffold(
//       appBar: AppBar(title: Text('하이브테스트')),
//       body: SingleChildScrollView(
//           child: ValueListenableBuilder(
//         valueListenable: Hive.box<Test>('test').listenable(),
//         builder: (context, Box<Test> box, child) {
//           return ListView.separated(
//               shrinkWrap: true,
//               itemCount: box.length,
//               separatorBuilder: (_, index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.0),
//                   child: Divider(),
//                 );
//               },
//               itemBuilder: (context, index) {
//                 final item = box.getAt(index);

//                 if (item == null) {
//                   return Container();
//                 }

//                 return ListTile(
//                   leading: Text('${item.id}'),
//                   title: Text('${item.name}'),
//                   trailing: Text('${item.friends.length}'),
//                 );
//               });
//         },
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => HiveTest2(), binding: HiveTestBinding());
//         },
//         child: Icon(Icons.plus_one),
//       ),
//       bottomSheet: Container(
//         height: Get.height * 0.1,
//         child: TextButton(
//           onPressed: () async {
//             final box = await Hive.openBox<Test>('test');

//             // box.put();
//             for (int i = 0; i < box.length; i++) {
//               final item = box.getAt(i);
//               Set friends = item!.friends.toSet();
//               friends.add('안녕');
//               box.put(i, Test(id: item.id, name: item.name, friends: friends.toList()));

//               // final test =
//               // final test = Test();
//             }
//             //  print(box.get(0)!.friends);
//           },
//           child: Text('누르세요'),
//         ),
//       ),
//     );
//   }
// }
