import 'package:drift/drift.dart';
import 'package:real_app_2/models/drift/database.dart';

part 'test_entity.g.dart';

class Test1Entity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get message => text()();
}

class Test2Entity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get message => text()();

  IntColumn get test1 => integer().nullable().references(Test1Entity, #id)();
}

class Test12Model {
  final Test1EntityData test1;
  final Test2EntityData test2;

  Test12Model(this.test1, this.test2);
}

@DriftAccessor(tables: [Test1Entity, Test2Entity])
class Test1EntityDao extends DatabaseAccessor<AppDatabase>
    with _$Test1EntityDaoMixin {
  Test1EntityDao(AppDatabase db) : super(db);

  Stream<List<Test1EntityData>> streamtest1() => select(test1Entity).watch();

  Stream<List<Test12Model>> streamJoin12() {
    final data = select(test2Entity).join([
      leftOuterJoin(test1Entity, test1Entity.id.equalsExp(test2Entity.test1))
    ]);
    return data.watch().map((rows) {
      return rows.map((row) {
        return Test12Model(
            row.readTable(test1Entity), row.readTable(test2Entity));
      }).toList();
    });
  }

  Future insertTest1(Test1EntityCompanion data) async {
    await into(test1Entity).insert(data);
  }

  Future insertTest12(Test1EntityCompanion data1, String data2) async {
    return transaction(() async {
      final test1 = await into(test1Entity).insert(data1);
      await into(test2Entity).insert(
          Test2EntityCompanion(test1: Value(test1), message: Value(data2)));
    });
  }
}
