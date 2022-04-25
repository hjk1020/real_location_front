
class RoomListItems {
    RoomListItems({
        required this.title,
       required this.id,
       required this.minAge,
       required this.maxAge,
       required this.pop,
       required this.locationTitle,
       required this.expireRoomDate,
       required this.gender,
       required this.memberCount,
       required this.bangjangName,
       required this.bangjangThumbnail,
       required this.createdAt,
       required this.subInteresting,
       required this.locationidx,
       required this.distance,
    });

    String title;
    String id;
    int minAge;
    int maxAge;
    int pop;
    String locationTitle;
    int expireRoomDate;
    String gender;
    String memberCount;
    String bangjangName;
    String bangjangThumbnail;
    DateTime createdAt;
    String subInteresting;
    int locationidx;
    double distance;

    factory RoomListItems.fromJson(Map<String, dynamic> json) => RoomListItems(
        title: json["title"],
        id: json["id"],
        minAge: json["min_age"],
        maxAge: json["max_age"],
        pop: json["pop"],
        locationTitle: json["location_title"],
        expireRoomDate: json["expire_room_date"],
        gender: json["gender"],
        memberCount: json["member_count"],
        bangjangName: json["bangjang_name"],
        bangjangThumbnail: json["bangjang_thumbnail"],
        createdAt: DateTime.parse(json["created_at"]),
        subInteresting: json["sub_interesting"],
        locationidx: json["locationidx"],
        distance: json["distance"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "min_age": minAge,
        "max_age": maxAge,
        "pop": pop,
        "location_title": locationTitle,
        "expire_room_date": expireRoomDate,
        "gender": gender,
        "member_count": memberCount,
        "bangjang_name": bangjangName,
        "bangjang_thumbnail": bangjangThumbnail,
        "created_at": createdAt.toIso8601String(),
        "sub_interesting": subInteresting,
        "locationidx": locationidx,
        "distance": distance,
    };
}
