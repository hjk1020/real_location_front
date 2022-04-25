class MyMainLocation {
    MyMainLocation({
        required this.permission,
        required this.locationName,
        required this.x,
        required this.y,
    });

    String permission;
    String locationName;
    double x;
    double y;

    factory MyMainLocation.fromJson(Map<String, dynamic> json) => MyMainLocation(
        permission: json["permission"],
        locationName: json["location_name"],
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "permission": permission,
        "location_name": locationName,
        "x": x,
        "y": y,
    };
}
