class RoomCreateData {
  RoomCreateData({
    required this.roomType,
    required this.userId,
    required this.roomId,
    required this.roomUserType,
    required this.userName,
    required this.userThumbnail,
    required this.roomTitle,
  });

  String roomType;
  String userId;
  String roomId;
  String roomUserType;
  String userName;
  String userThumbnail;
  String roomTitle;

  factory RoomCreateData.fromJson(Map<String, dynamic> json) => RoomCreateData(
        roomType: json["room_type"],
        userId: json["user_id"],
        roomId: json["room_id"],
        roomUserType: json["room_user_type"],
        userName: json["user_name"],
        userThumbnail: json["user_thumbnail"],
        roomTitle: json["room_title"],
      );

  Map<String, dynamic> toJson() => {
        "room_type": roomType,
        "user_id": userId,
        "room_id": roomId,
        "room_user_type": roomUserType,
        "user_name": userName,
        "user_thumbnail": userThumbnail,
        "room_title": roomTitle,
      };
}
