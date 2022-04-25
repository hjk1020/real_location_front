import 'package:drift/drift.dart';
import 'package:real_app_2/models/drift/room_entity.dart';

class RoomMemberEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text()();
  TextColumn get roomUserType => text()();
  TextColumn get roomId => text()();
  TextColumn get name => text()();
  TextColumn get profileImage => text()();

  IntColumn get room => integer().nullable().references(RoomEntity, #id)();
}