import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:real_app_2/models/drift/database.dart';
import 'package:real_app_2/models/drift/test_entity.dart';
import 'package:real_app_2/pages/drift_test2.dart';

class DriftTest extends StatefulWidget {
  DriftTest({Key? key}) : super(key: key);

  @override
  State<DriftTest> createState() => _DriftTestState();
}

class _DriftTestState extends State<DriftTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (!GetIt.instance.isRegistered<Test1EntityDao>()) {
      final db = AppDatabase();

      GetIt.instance.registerSingleton<Test1EntityDao>(Test1EntityDao(db));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dao = GetIt.instance<Test1EntityDao>();

    return Scaffold(
      appBar: AppBar(
        title: Text('드리프트 테스트'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Test12Model>>(
          stream: dao.streamJoin12(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    final item = data[index];
                    return ListTile(
                      leading: Text('${item.test1.id}'),
                      trailing: Text('${item.test2.id}'),
                      title: Text(item.test1.message),
                      subtitle: Text(item.test2.message),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemCount: data.length);
            } else {
              return Container();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Get.to(() => DriftTest2());
        },
      ),
    );
  }
}
