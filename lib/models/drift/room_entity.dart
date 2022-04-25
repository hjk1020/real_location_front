import 'package:drift/drift.dart';
import 'package:real_app_2/models/drift/database.dart';

part 'room_entity.g.dart';

class RoomEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get roomId => text()();
  TextColumn get title => text()();
  TextColumn get roomType => text()();
  IntColumn get expireDate => integer().nullable()();
  TextColumn get lastChat => text().nullable()();
  IntColumn get unreadChat => integer().withDefault(const Constant(0))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer().nullable()();

  // @override
  // List<String> get customConstraints => ['UNIQUE (roomId)'];
}

@DriftAccessor(tables: [RoomEntity])
class RoomEntityDao extends DatabaseAccessor<AppDatabase>
    with _$RoomEntityDaoMixin {
  RoomEntityDao(AppDatabase db) : super(db);

  Stream<List<RoomEntityData>> streamRooms() => select(roomEntity).watch();

  Future insertRoom(RoomEntityCompanion data) async {
    await into(roomEntity).insert(data);
  }
}
