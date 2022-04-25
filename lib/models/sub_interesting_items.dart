class SubInterestingItems {
  SubInterestingItems({
    required this.id,
    required this.subInteresting,
    required this.userId,
  });

  String id;
  String subInteresting;
  String userId;

  factory SubInterestingItems.fromJson(Map<String, dynamic> json) =>
      SubInterestingItems(
        id: json["id"],
        subInteresting: json["sub_interesting"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_interesting": subInteresting,
        "user_id": userId,
      };
}
