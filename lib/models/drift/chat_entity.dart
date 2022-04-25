import 'package:drift/drift.dart';
import 'package:real_app_2/models/drift/room_member_entity.dart';

class ChatEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get chatType => text()();
  TextColumn get roomId => text()();
  TextColumn get userId => text()();
  TextColumn get message => text().nullable()();
  BoolColumn get myRead => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();

  IntColumn get roomMember =>
      integer().nullable().references(RoomMemberEntity, #id)();
}

