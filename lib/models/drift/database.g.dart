// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class RoomEntityData extends DataClass implements Insertable<RoomEntityData> {
  final int id;
  final String roomId;
  final String title;
  final String roomType;
  final int? expireDate;
  final String? lastChat;
  final int unreadChat;
  final int createdAt;
  final int? updatedAt;
  RoomEntityData(
      {required this.id,
      required this.roomId,
      required this.title,
      required this.roomType,
      this.expireDate,
      this.lastChat,
      required this.unreadChat,
      required this.createdAt,
      this.updatedAt});
  factory RoomEntityData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoomEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      roomId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      roomType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_type'])!,
      expireDate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}expire_date']),
      lastChat: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_chat']),
      unreadChat: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unread_chat'])!,
      createdAt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_id'] = Variable<String>(roomId);
    map['title'] = Variable<String>(title);
    map['room_type'] = Variable<String>(roomType);
    if (!nullToAbsent || expireDate != null) {
      map['expire_date'] = Variable<int?>(expireDate);
    }
    if (!nullToAbsent || lastChat != null) {
      map['last_chat'] = Variable<String?>(lastChat);
    }
    map['unread_chat'] = Variable<int>(unreadChat);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int?>(updatedAt);
    }
    return map;
  }

  RoomEntityCompanion toCompanion(bool nullToAbsent) {
    return RoomEntityCompanion(
      id: Value(id),
      roomId: Value(roomId),
      title: Value(title),
      roomType: Value(roomType),
      expireDate: expireDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expireDate),
      lastChat: lastChat == null && nullToAbsent
          ? const Value.absent()
          : Value(lastChat),
      unreadChat: Value(unreadChat),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory RoomEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEntityData(
      id: serializer.fromJson<int>(json['id']),
      roomId: serializer.fromJson<String>(json['roomId']),
      title: serializer.fromJson<String>(json['title']),
      roomType: serializer.fromJson<String>(json['roomType']),
      expireDate: serializer.fromJson<int?>(json['expireDate']),
      lastChat: serializer.fromJson<String?>(json['lastChat']),
      unreadChat: serializer.fromJson<int>(json['unreadChat']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomId': serializer.toJson<String>(roomId),
      'title': serializer.toJson<String>(title),
      'roomType': serializer.toJson<String>(roomType),
      'expireDate': serializer.toJson<int?>(expireDate),
      'lastChat': serializer.toJson<String?>(lastChat),
      'unreadChat': serializer.toJson<int>(unreadChat),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
    };
  }

  RoomEntityData copyWith(
          {int? id,
          String? roomId,
          String? title,
          String? roomType,
          int? expireDate,
          String? lastChat,
          int? unreadChat,
          int? createdAt,
          int? updatedAt}) =>
      RoomEntityData(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        title: title ?? this.title,
        roomType: roomType ?? this.roomType,
        expireDate: expireDate ?? this.expireDate,
        lastChat: lastChat ?? this.lastChat,
        unreadChat: unreadChat ?? this.unreadChat,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('RoomEntityData(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('title: $title, ')
          ..write('roomType: $roomType, ')
          ..write('expireDate: $expireDate, ')
          ..write('lastChat: $lastChat, ')
          ..write('unreadChat: $unreadChat, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomId, title, roomType, expireDate,
      lastChat, unreadChat, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEntityData &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.title == this.title &&
          other.roomType == this.roomType &&
          other.expireDate == this.expireDate &&
          other.lastChat == this.lastChat &&
          other.unreadChat == this.unreadChat &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RoomEntityCompanion extends UpdateCompanion<RoomEntityData> {
  final Value<int> id;
  final Value<String> roomId;
  final Value<String> title;
  final Value<String> roomType;
  final Value<int?> expireDate;
  final Value<String?> lastChat;
  final Value<int> unreadChat;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  const RoomEntityCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.title = const Value.absent(),
    this.roomType = const Value.absent(),
    this.expireDate = const Value.absent(),
    this.lastChat = const Value.absent(),
    this.unreadChat = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RoomEntityCompanion.insert({
    this.id = const Value.absent(),
    required String roomId,
    required String title,
    required String roomType,
    this.expireDate = const Value.absent(),
    this.lastChat = const Value.absent(),
    this.unreadChat = const Value.absent(),
    required int createdAt,
    this.updatedAt = const Value.absent(),
  })  : roomId = Value(roomId),
        title = Value(title),
        roomType = Value(roomType),
        createdAt = Value(createdAt);
  static Insertable<RoomEntityData> custom({
    Expression<int>? id,
    Expression<String>? roomId,
    Expression<String>? title,
    Expression<String>? roomType,
    Expression<int?>? expireDate,
    Expression<String?>? lastChat,
    Expression<int>? unreadChat,
    Expression<int>? createdAt,
    Expression<int?>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (title != null) 'title': title,
      if (roomType != null) 'room_type': roomType,
      if (expireDate != null) 'expire_date': expireDate,
      if (lastChat != null) 'last_chat': lastChat,
      if (unreadChat != null) 'unread_chat': unreadChat,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RoomEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? roomId,
      Value<String>? title,
      Value<String>? roomType,
      Value<int?>? expireDate,
      Value<String?>? lastChat,
      Value<int>? unreadChat,
      Value<int>? createdAt,
      Value<int?>? updatedAt}) {
    return RoomEntityCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      title: title ?? this.title,
      roomType: roomType ?? this.roomType,
      expireDate: expireDate ?? this.expireDate,
      lastChat: lastChat ?? this.lastChat,
      unreadChat: unreadChat ?? this.unreadChat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (roomType.present) {
      map['room_type'] = Variable<String>(roomType.value);
    }
    if (expireDate.present) {
      map['expire_date'] = Variable<int?>(expireDate.value);
    }
    if (lastChat.present) {
      map['last_chat'] = Variable<String?>(lastChat.value);
    }
    if (unreadChat.present) {
      map['unread_chat'] = Variable<int>(unreadChat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int?>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomEntityCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('title: $title, ')
          ..write('roomType: $roomType, ')
          ..write('expireDate: $expireDate, ')
          ..write('lastChat: $lastChat, ')
          ..write('unreadChat: $unreadChat, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RoomEntityTable extends RoomEntity
    with TableInfo<$RoomEntityTable, RoomEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String?> roomId = GeneratedColumn<String?>(
      'room_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roomTypeMeta = const VerificationMeta('roomType');
  @override
  late final GeneratedColumn<String?> roomType = GeneratedColumn<String?>(
      'room_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _expireDateMeta = const VerificationMeta('expireDate');
  @override
  late final GeneratedColumn<int?> expireDate = GeneratedColumn<int?>(
      'expire_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _lastChatMeta = const VerificationMeta('lastChat');
  @override
  late final GeneratedColumn<String?> lastChat = GeneratedColumn<String?>(
      'last_chat', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _unreadChatMeta = const VerificationMeta('unreadChat');
  @override
  late final GeneratedColumn<int?> unreadChat = GeneratedColumn<int?>(
      'unread_chat', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int?> createdAt = GeneratedColumn<int?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int?> updatedAt = GeneratedColumn<int?>(
      'updated_at', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        roomId,
        title,
        roomType,
        expireDate,
        lastChat,
        unreadChat,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'room_entity';
  @override
  String get actualTableName => 'room_entity';
  @override
  VerificationContext validateIntegrity(Insertable<RoomEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('room_type')) {
      context.handle(_roomTypeMeta,
          roomType.isAcceptableOrUnknown(data['room_type']!, _roomTypeMeta));
    } else if (isInserting) {
      context.missing(_roomTypeMeta);
    }
    if (data.containsKey('expire_date')) {
      context.handle(
          _expireDateMeta,
          expireDate.isAcceptableOrUnknown(
              data['expire_date']!, _expireDateMeta));
    }
    if (data.containsKey('last_chat')) {
      context.handle(_lastChatMeta,
          lastChat.isAcceptableOrUnknown(data['last_chat']!, _lastChatMeta));
    }
    if (data.containsKey('unread_chat')) {
      context.handle(
          _unreadChatMeta,
          unreadChat.isAcceptableOrUnknown(
              data['unread_chat']!, _unreadChatMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoomEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoomEntityTable createAlias(String alias) {
    return $RoomEntityTable(attachedDatabase, alias);
  }
}

class RoomMemberEntityData extends DataClass
    implements Insertable<RoomMemberEntityData> {
  final int id;
  final String userId;
  final String roomUserType;
  final String roomId;
  final String name;
  final String profileImage;
  final int? room;
  RoomMemberEntityData(
      {required this.id,
      required this.userId,
      required this.roomUserType,
      required this.roomId,
      required this.name,
      required this.profileImage,
      this.room});
  factory RoomMemberEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoomMemberEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      roomUserType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_user_type'])!,
      roomId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      profileImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_image'])!,
      room: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['room_user_type'] = Variable<String>(roomUserType);
    map['room_id'] = Variable<String>(roomId);
    map['name'] = Variable<String>(name);
    map['profile_image'] = Variable<String>(profileImage);
    if (!nullToAbsent || room != null) {
      map['room'] = Variable<int?>(room);
    }
    return map;
  }

  RoomMemberEntityCompanion toCompanion(bool nullToAbsent) {
    return RoomMemberEntityCompanion(
      id: Value(id),
      userId: Value(userId),
      roomUserType: Value(roomUserType),
      roomId: Value(roomId),
      name: Value(name),
      profileImage: Value(profileImage),
      room: room == null && nullToAbsent ? const Value.absent() : Value(room),
    );
  }

  factory RoomMemberEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomMemberEntityData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      roomUserType: serializer.fromJson<String>(json['roomUserType']),
      roomId: serializer.fromJson<String>(json['roomId']),
      name: serializer.fromJson<String>(json['name']),
      profileImage: serializer.fromJson<String>(json['profileImage']),
      room: serializer.fromJson<int?>(json['room']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'roomUserType': serializer.toJson<String>(roomUserType),
      'roomId': serializer.toJson<String>(roomId),
      'name': serializer.toJson<String>(name),
      'profileImage': serializer.toJson<String>(profileImage),
      'room': serializer.toJson<int?>(room),
    };
  }

  RoomMemberEntityData copyWith(
          {int? id,
          String? userId,
          String? roomUserType,
          String? roomId,
          String? name,
          String? profileImage,
          int? room}) =>
      RoomMemberEntityData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        roomUserType: roomUserType ?? this.roomUserType,
        roomId: roomId ?? this.roomId,
        name: name ?? this.name,
        profileImage: profileImage ?? this.profileImage,
        room: room ?? this.room,
      );
  @override
  String toString() {
    return (StringBuffer('RoomMemberEntityData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('roomUserType: $roomUserType, ')
          ..write('roomId: $roomId, ')
          ..write('name: $name, ')
          ..write('profileImage: $profileImage, ')
          ..write('room: $room')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, roomUserType, roomId, name, profileImage, room);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomMemberEntityData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.roomUserType == this.roomUserType &&
          other.roomId == this.roomId &&
          other.name == this.name &&
          other.profileImage == this.profileImage &&
          other.room == this.room);
}

class RoomMemberEntityCompanion extends UpdateCompanion<RoomMemberEntityData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> roomUserType;
  final Value<String> roomId;
  final Value<String> name;
  final Value<String> profileImage;
  final Value<int?> room;
  const RoomMemberEntityCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.roomUserType = const Value.absent(),
    this.roomId = const Value.absent(),
    this.name = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.room = const Value.absent(),
  });
  RoomMemberEntityCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String roomUserType,
    required String roomId,
    required String name,
    required String profileImage,
    this.room = const Value.absent(),
  })  : userId = Value(userId),
        roomUserType = Value(roomUserType),
        roomId = Value(roomId),
        name = Value(name),
        profileImage = Value(profileImage);
  static Insertable<RoomMemberEntityData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? roomUserType,
    Expression<String>? roomId,
    Expression<String>? name,
    Expression<String>? profileImage,
    Expression<int?>? room,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (roomUserType != null) 'room_user_type': roomUserType,
      if (roomId != null) 'room_id': roomId,
      if (name != null) 'name': name,
      if (profileImage != null) 'profile_image': profileImage,
      if (room != null) 'room': room,
    });
  }

  RoomMemberEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<String>? roomUserType,
      Value<String>? roomId,
      Value<String>? name,
      Value<String>? profileImage,
      Value<int?>? room}) {
    return RoomMemberEntityCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      roomUserType: roomUserType ?? this.roomUserType,
      roomId: roomId ?? this.roomId,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      room: room ?? this.room,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (roomUserType.present) {
      map['room_user_type'] = Variable<String>(roomUserType.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (room.present) {
      map['room'] = Variable<int?>(room.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomMemberEntityCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('roomUserType: $roomUserType, ')
          ..write('roomId: $roomId, ')
          ..write('name: $name, ')
          ..write('profileImage: $profileImage, ')
          ..write('room: $room')
          ..write(')'))
        .toString();
  }
}

class $RoomMemberEntityTable extends RoomMemberEntity
    with TableInfo<$RoomMemberEntityTable, RoomMemberEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomMemberEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roomUserTypeMeta =
      const VerificationMeta('roomUserType');
  @override
  late final GeneratedColumn<String?> roomUserType = GeneratedColumn<String?>(
      'room_user_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String?> roomId = GeneratedColumn<String?>(
      'room_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String?> profileImage = GeneratedColumn<String?>(
      'profile_image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roomMeta = const VerificationMeta('room');
  @override
  late final GeneratedColumn<int?> room = GeneratedColumn<int?>(
      'room', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES room_entity (id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, roomUserType, roomId, name, profileImage, room];
  @override
  String get aliasedName => _alias ?? 'room_member_entity';
  @override
  String get actualTableName => 'room_member_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomMemberEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('room_user_type')) {
      context.handle(
          _roomUserTypeMeta,
          roomUserType.isAcceptableOrUnknown(
              data['room_user_type']!, _roomUserTypeMeta));
    } else if (isInserting) {
      context.missing(_roomUserTypeMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    } else if (isInserting) {
      context.missing(_profileImageMeta);
    }
    if (data.containsKey('room')) {
      context.handle(
          _roomMeta, room.isAcceptableOrUnknown(data['room']!, _roomMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomMemberEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoomMemberEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoomMemberEntityTable createAlias(String alias) {
    return $RoomMemberEntityTable(attachedDatabase, alias);
  }
}

class ChatEntityData extends DataClass implements Insertable<ChatEntityData> {
  final int id;
  final String chatType;
  final String roomId;
  final String userId;
  final String? message;
  final bool myRead;
  final int createdAt;
  final int? roomMember;
  ChatEntityData(
      {required this.id,
      required this.chatType,
      required this.roomId,
      required this.userId,
      this.message,
      required this.myRead,
      required this.createdAt,
      this.roomMember});
  factory ChatEntityData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChatEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      chatType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_type'])!,
      roomId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message']),
      myRead: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}my_read'])!,
      createdAt: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      roomMember: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}room_member']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chat_type'] = Variable<String>(chatType);
    map['room_id'] = Variable<String>(roomId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String?>(message);
    }
    map['my_read'] = Variable<bool>(myRead);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || roomMember != null) {
      map['room_member'] = Variable<int?>(roomMember);
    }
    return map;
  }

  ChatEntityCompanion toCompanion(bool nullToAbsent) {
    return ChatEntityCompanion(
      id: Value(id),
      chatType: Value(chatType),
      roomId: Value(roomId),
      userId: Value(userId),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      myRead: Value(myRead),
      createdAt: Value(createdAt),
      roomMember: roomMember == null && nullToAbsent
          ? const Value.absent()
          : Value(roomMember),
    );
  }

  factory ChatEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatEntityData(
      id: serializer.fromJson<int>(json['id']),
      chatType: serializer.fromJson<String>(json['chatType']),
      roomId: serializer.fromJson<String>(json['roomId']),
      userId: serializer.fromJson<String>(json['userId']),
      message: serializer.fromJson<String?>(json['message']),
      myRead: serializer.fromJson<bool>(json['myRead']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      roomMember: serializer.fromJson<int?>(json['roomMember']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatType': serializer.toJson<String>(chatType),
      'roomId': serializer.toJson<String>(roomId),
      'userId': serializer.toJson<String>(userId),
      'message': serializer.toJson<String?>(message),
      'myRead': serializer.toJson<bool>(myRead),
      'createdAt': serializer.toJson<int>(createdAt),
      'roomMember': serializer.toJson<int?>(roomMember),
    };
  }

  ChatEntityData copyWith(
          {int? id,
          String? chatType,
          String? roomId,
          String? userId,
          String? message,
          bool? myRead,
          int? createdAt,
          int? roomMember}) =>
      ChatEntityData(
        id: id ?? this.id,
        chatType: chatType ?? this.chatType,
        roomId: roomId ?? this.roomId,
        userId: userId ?? this.userId,
        message: message ?? this.message,
        myRead: myRead ?? this.myRead,
        createdAt: createdAt ?? this.createdAt,
        roomMember: roomMember ?? this.roomMember,
      );
  @override
  String toString() {
    return (StringBuffer('ChatEntityData(')
          ..write('id: $id, ')
          ..write('chatType: $chatType, ')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('myRead: $myRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('roomMember: $roomMember')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, chatType, roomId, userId, message, myRead, createdAt, roomMember);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatEntityData &&
          other.id == this.id &&
          other.chatType == this.chatType &&
          other.roomId == this.roomId &&
          other.userId == this.userId &&
          other.message == this.message &&
          other.myRead == this.myRead &&
          other.createdAt == this.createdAt &&
          other.roomMember == this.roomMember);
}

class ChatEntityCompanion extends UpdateCompanion<ChatEntityData> {
  final Value<int> id;
  final Value<String> chatType;
  final Value<String> roomId;
  final Value<String> userId;
  final Value<String?> message;
  final Value<bool> myRead;
  final Value<int> createdAt;
  final Value<int?> roomMember;
  const ChatEntityCompanion({
    this.id = const Value.absent(),
    this.chatType = const Value.absent(),
    this.roomId = const Value.absent(),
    this.userId = const Value.absent(),
    this.message = const Value.absent(),
    this.myRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.roomMember = const Value.absent(),
  });
  ChatEntityCompanion.insert({
    this.id = const Value.absent(),
    required String chatType,
    required String roomId,
    required String userId,
    this.message = const Value.absent(),
    this.myRead = const Value.absent(),
    required int createdAt,
    this.roomMember = const Value.absent(),
  })  : chatType = Value(chatType),
        roomId = Value(roomId),
        userId = Value(userId),
        createdAt = Value(createdAt);
  static Insertable<ChatEntityData> custom({
    Expression<int>? id,
    Expression<String>? chatType,
    Expression<String>? roomId,
    Expression<String>? userId,
    Expression<String?>? message,
    Expression<bool>? myRead,
    Expression<int>? createdAt,
    Expression<int?>? roomMember,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatType != null) 'chat_type': chatType,
      if (roomId != null) 'room_id': roomId,
      if (userId != null) 'user_id': userId,
      if (message != null) 'message': message,
      if (myRead != null) 'my_read': myRead,
      if (createdAt != null) 'created_at': createdAt,
      if (roomMember != null) 'room_member': roomMember,
    });
  }

  ChatEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? chatType,
      Value<String>? roomId,
      Value<String>? userId,
      Value<String?>? message,
      Value<bool>? myRead,
      Value<int>? createdAt,
      Value<int?>? roomMember}) {
    return ChatEntityCompanion(
      id: id ?? this.id,
      chatType: chatType ?? this.chatType,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      myRead: myRead ?? this.myRead,
      createdAt: createdAt ?? this.createdAt,
      roomMember: roomMember ?? this.roomMember,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatType.present) {
      map['chat_type'] = Variable<String>(chatType.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (message.present) {
      map['message'] = Variable<String?>(message.value);
    }
    if (myRead.present) {
      map['my_read'] = Variable<bool>(myRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (roomMember.present) {
      map['room_member'] = Variable<int?>(roomMember.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatEntityCompanion(')
          ..write('id: $id, ')
          ..write('chatType: $chatType, ')
          ..write('roomId: $roomId, ')
          ..write('userId: $userId, ')
          ..write('message: $message, ')
          ..write('myRead: $myRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('roomMember: $roomMember')
          ..write(')'))
        .toString();
  }
}

class $ChatEntityTable extends ChatEntity
    with TableInfo<$ChatEntityTable, ChatEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _chatTypeMeta = const VerificationMeta('chatType');
  @override
  late final GeneratedColumn<String?> chatType = GeneratedColumn<String?>(
      'chat_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String?> roomId = GeneratedColumn<String?>(
      'room_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _myReadMeta = const VerificationMeta('myRead');
  @override
  late final GeneratedColumn<bool?> myRead = GeneratedColumn<bool?>(
      'my_read', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (my_read IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int?> createdAt = GeneratedColumn<int?>(
      'created_at', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _roomMemberMeta = const VerificationMeta('roomMember');
  @override
  late final GeneratedColumn<int?> roomMember = GeneratedColumn<int?>(
      'room_member', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES room_member_entity (id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, chatType, roomId, userId, message, myRead, createdAt, roomMember];
  @override
  String get aliasedName => _alias ?? 'chat_entity';
  @override
  String get actualTableName => 'chat_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ChatEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_type')) {
      context.handle(_chatTypeMeta,
          chatType.isAcceptableOrUnknown(data['chat_type']!, _chatTypeMeta));
    } else if (isInserting) {
      context.missing(_chatTypeMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    }
    if (data.containsKey('my_read')) {
      context.handle(_myReadMeta,
          myRead.isAcceptableOrUnknown(data['my_read']!, _myReadMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('room_member')) {
      context.handle(
          _roomMemberMeta,
          roomMember.isAcceptableOrUnknown(
              data['room_member']!, _roomMemberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChatEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatEntityTable createAlias(String alias) {
    return $ChatEntityTable(attachedDatabase, alias);
  }
}

class Test1EntityData extends DataClass implements Insertable<Test1EntityData> {
  final int id;
  final String message;
  Test1EntityData({required this.id, required this.message});
  factory Test1EntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Test1EntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message'] = Variable<String>(message);
    return map;
  }

  Test1EntityCompanion toCompanion(bool nullToAbsent) {
    return Test1EntityCompanion(
      id: Value(id),
      message: Value(message),
    );
  }

  factory Test1EntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Test1EntityData(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
    };
  }

  Test1EntityData copyWith({int? id, String? message}) => Test1EntityData(
        id: id ?? this.id,
        message: message ?? this.message,
      );
  @override
  String toString() {
    return (StringBuffer('Test1EntityData(')
          ..write('id: $id, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, message);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Test1EntityData &&
          other.id == this.id &&
          other.message == this.message);
}

class Test1EntityCompanion extends UpdateCompanion<Test1EntityData> {
  final Value<int> id;
  final Value<String> message;
  const Test1EntityCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
  });
  Test1EntityCompanion.insert({
    this.id = const Value.absent(),
    required String message,
  }) : message = Value(message);
  static Insertable<Test1EntityData> custom({
    Expression<int>? id,
    Expression<String>? message,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
    });
  }

  Test1EntityCompanion copyWith({Value<int>? id, Value<String>? message}) {
    return Test1EntityCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Test1EntityCompanion(')
          ..write('id: $id, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }
}

class $Test1EntityTable extends Test1Entity
    with TableInfo<$Test1EntityTable, Test1EntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Test1EntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, message];
  @override
  String get aliasedName => _alias ?? 'test1_entity';
  @override
  String get actualTableName => 'test1_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Test1EntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Test1EntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Test1EntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $Test1EntityTable createAlias(String alias) {
    return $Test1EntityTable(attachedDatabase, alias);
  }
}

class Test2EntityData extends DataClass implements Insertable<Test2EntityData> {
  final int id;
  final String message;
  final int? test1;
  Test2EntityData({required this.id, required this.message, this.test1});
  factory Test2EntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Test2EntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      test1: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}test1']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || test1 != null) {
      map['test1'] = Variable<int?>(test1);
    }
    return map;
  }

  Test2EntityCompanion toCompanion(bool nullToAbsent) {
    return Test2EntityCompanion(
      id: Value(id),
      message: Value(message),
      test1:
          test1 == null && nullToAbsent ? const Value.absent() : Value(test1),
    );
  }

  factory Test2EntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Test2EntityData(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      test1: serializer.fromJson<int?>(json['test1']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'test1': serializer.toJson<int?>(test1),
    };
  }

  Test2EntityData copyWith({int? id, String? message, int? test1}) =>
      Test2EntityData(
        id: id ?? this.id,
        message: message ?? this.message,
        test1: test1 ?? this.test1,
      );
  @override
  String toString() {
    return (StringBuffer('Test2EntityData(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('test1: $test1')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, message, test1);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Test2EntityData &&
          other.id == this.id &&
          other.message == this.message &&
          other.test1 == this.test1);
}

class Test2EntityCompanion extends UpdateCompanion<Test2EntityData> {
  final Value<int> id;
  final Value<String> message;
  final Value<int?> test1;
  const Test2EntityCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.test1 = const Value.absent(),
  });
  Test2EntityCompanion.insert({
    this.id = const Value.absent(),
    required String message,
    this.test1 = const Value.absent(),
  }) : message = Value(message);
  static Insertable<Test2EntityData> custom({
    Expression<int>? id,
    Expression<String>? message,
    Expression<int?>? test1,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (test1 != null) 'test1': test1,
    });
  }

  Test2EntityCompanion copyWith(
      {Value<int>? id, Value<String>? message, Value<int?>? test1}) {
    return Test2EntityCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      test1: test1 ?? this.test1,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (test1.present) {
      map['test1'] = Variable<int?>(test1.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Test2EntityCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('test1: $test1')
          ..write(')'))
        .toString();
  }
}

class $Test2EntityTable extends Test2Entity
    with TableInfo<$Test2EntityTable, Test2EntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Test2EntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _test1Meta = const VerificationMeta('test1');
  @override
  late final GeneratedColumn<int?> test1 = GeneratedColumn<int?>(
      'test1', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES test1_entity (id)');
  @override
  List<GeneratedColumn> get $columns => [id, message, test1];
  @override
  String get aliasedName => _alias ?? 'test2_entity';
  @override
  String get actualTableName => 'test2_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Test2EntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('test1')) {
      context.handle(
          _test1Meta, test1.isAcceptableOrUnknown(data['test1']!, _test1Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Test2EntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Test2EntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $Test2EntityTable createAlias(String alias) {
    return $Test2EntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RoomEntityTable roomEntity = $RoomEntityTable(this);
  late final $RoomMemberEntityTable roomMemberEntity =
      $RoomMemberEntityTable(this);
  late final $ChatEntityTable chatEntity = $ChatEntityTable(this);
  late final $Test1EntityTable test1Entity = $Test1EntityTable(this);
  late final $Test2EntityTable test2Entity = $Test2EntityTable(this);
  late final Test1EntityDao test1EntityDao =
      Test1EntityDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [roomEntity, roomMemberEntity, chatEntity, test1Entity, test2Entity];
}
