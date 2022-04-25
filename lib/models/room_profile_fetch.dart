class RoomProfileFetch {
  RoomProfileFetch({
    required this.title,
    required this.description,
    required this.pop,
    required this.subInteresting,
    required this.gender,
    required this.minAge,
    required this.maxAge,
    required this.locationTitle,
    required this.expireRoomDate,
    required this.createdAt,
    required this.member,
    required this.roomThumbnail,
  });

  String title;
  String description;
  int pop;
  String subInteresting;
  String gender;
  int minAge;
  int maxAge;
  String locationTitle;
  int expireRoomDate;
  String createdAt;
  List<Member> member;
  Thumbnail roomThumbnail;

  factory RoomProfileFetch.fromJson(Map<String, dynamic> json) =>
      RoomProfileFetch(
        title: json["title"],
        description: json["description"],
        pop: json["pop"],
        subInteresting: json["sub_interesting"],
        gender: json["gender"],
        minAge: json["min_age"],
        maxAge: json["max_age"],
        locationTitle: json["location_title"],
        expireRoomDate: json["expire_room_date"],
        createdAt: json["created_at"],
        member:
            List<Member>.from(json["member"].map((x) => Member.fromJson(x))),
        roomThumbnail: Thumbnail.fromJson(json["room_thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "pop": pop,
        "sub_interesting": subInteresting,
        "gender": gender,
        "min_age": minAge,
        "max_age": maxAge,
        "location_title": locationTitle,
        "expire_room_date": expireRoomDate,
        "created_at": createdAt,
        "member": List<dynamic>.from(member.map((x) => x.toJson())),
        "room_thumbnail": roomThumbnail.toJson(),
      };
}

class Member {
  Member({
    required this.userType,
    required this.user,
  });

  String userType;
  User user;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        userType: json["userType"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "userType": userType,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.name,
    required this.gender,
    this.selfMessage,
    required this.thumbnail,
  });

  String name;
  String gender;
  String? selfMessage;
  Thumbnail thumbnail;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        gender: json["gender"],
        selfMessage: json["self_message"] == null ? null : json["self_message"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "self_message": selfMessage == null ? null : selfMessage,
        "thumbnail": thumbnail.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    required this.url,
  });

  String url;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
