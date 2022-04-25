class RoomProfileUserItems {
  RoomProfileUserItems({
    required this.userType,
    required this.username,
    required this.userGender,
    this.selfMessage,
    required this.userThumbnail,
  });

  String userType;
  String username;
  String userGender;
  String? selfMessage;
  String userThumbnail;

  factory RoomProfileUserItems.fromJson(Map<String, dynamic> json) =>
      RoomProfileUserItems(
        userType: json["userType"],
        username: json["username"],
        userGender: json["userGender"],
        selfMessage: json["self_message"] ?? '',
        userThumbnail: json["user_thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "userType": userType,
        "username": username,
        "userGender": userGender,
        "self_message": selfMessage ?? '',
        "user_thumbnail": userThumbnail,
      };
}
