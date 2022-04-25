class RoomProfileItem {
  RoomProfileItem({
    required this.title,
    required this.description,
    required this.pop,
    required this.subInteresting,
    required this.gender,
    required this.age,
    required this.locationTitle,
    required this.expireRoomDate,
    required this.createdAt,
    required this.roomThumbnail,
  });

  String title;
  String description;
  int pop;
  String subInteresting;
  String gender;
  String age;
  String locationTitle;
  int expireRoomDate;
  String createdAt;
  String roomThumbnail;

  factory RoomProfileItem.fromJson(Map<String, dynamic> json) =>
      RoomProfileItem(
        title: json["title"],
        description: json["description"],
        pop: json["pop"],
        subInteresting: json["subInteresting"],
        gender: json["gender"],
        age: json["age"],
        locationTitle: json["locationTitle"],
        expireRoomDate: json["expireRoomDate"],
        createdAt: json["createdAt"],
        roomThumbnail: json["roomThumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "pop": pop,
        "subInteresting": subInteresting,
        "gender": gender,
        "age": age,
        "locationTitle": locationTitle,
        "expireRoomDate": expireRoomDate,
        "createdAt": createdAt,
        "roomThumbnail": roomThumbnail,
      };
}
