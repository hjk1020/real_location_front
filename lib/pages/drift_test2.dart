import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get/get.dart' as p;
import 'package:get_it/get_it.dart';
import 'package:real_app_2/models/drift/database.dart';
import 'package:real_app_2/models/drift/test_entity.dart';

class DriftTest2 extends StatefulWidget {
  DriftTest2({Key? key}) : super(key: key);

  @override
  State<DriftTest2> createState() => _DriftTest2State();
}

class _DriftTest2State extends State<DriftTest2> {
  String message = '';
  String message2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('드리프트테스트2')),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                message = value;
              });
            },
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                message2 = value;
              });
            },
          ),
          TextButton(
              onPressed: () async {
                final dao = GetIt.instance<Test1EntityDao>();

                // await dao.insertTest1(
                //     Test1EntityCompanion(message: Value(this.message)));
                await dao.insertTest12(
                    Test1EntityCompanion(message: Value('안녕 하하')), 'ghgh');
                p.Get.back();
              },
              child: Text('입력'))
        ],
      ),
    );
  }
}
