import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:real_app_2/models/drift/room_entity.dart';
import 'package:real_app_2/models/drift/room_member_entity.dart';
import 'package:real_app_2/models/drift/test_entity.dart';

import 'chat_entity.dart';

part 'database.g.dart';

// class RoomEntity extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get roomId => text()();
//   TextColumn get title => text()();
//   TextColumn get roomType => text()();
//   IntColumn get expireDate => integer().nullable()();
//   TextColumn get lastChat => text().nullable()();
//   IntColumn get unreadChat => integer().withDefault(const Constant(0))();
//   IntColumn get createdAt => integer()();
//   IntColumn get updatedAt => integer().nullable()();

//   @override
//   List<String> get customConstraints => ['UNIQUE (roomId)'];
// }

// class RoomMemberEntity extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get userId => text()();
//   TextColumn get roomUserType => text()();
//   TextColumn get roomId => text()();
//   TextColumn get name => text()();
//   TextColumn get profileImage => text()();

//   IntColumn get room => integer().nullable().references(RoomEntity, #id)();
// }

// class ChatEntity extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get chatType => text()();
//   TextColumn get roomId => text()();
//   TextColumn get userId => text()();
//   TextColumn get message => text().nullable()();
//   BoolColumn get myRead => boolean().withDefault(const Constant(false))();
//   IntColumn get createdAt => integer()();

//   IntColumn get roomMember =>
//       integer().nullable().references(RoomMemberEntity, #id)();
// }

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// class AppDb extends _$AppDb {
//   AppDb() : super(_openConnection());
//   @override
//   int get schemaVersion => 1;
// }

@DriftDatabase(
    tables: [RoomEntity, RoomMemberEntity, ChatEntity, Test1Entity, Test2Entity],
    daos: [Test1EntityDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
