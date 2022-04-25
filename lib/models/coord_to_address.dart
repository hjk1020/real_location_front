class CoordToAddress {
  CoordToAddress({
    required this.regionType,
    required this.code,
    required this.addressName,
    required this.region1DepthName,
    required this.region2DepthName,
    required this.region3DepthName,
    required this.region4DepthName,
    required this.x,
    required this.y,
  });

  String regionType;
  String code;
  String addressName;
  String region1DepthName;
  String region2DepthName;
  String region3DepthName;
  String region4DepthName;
  double x;
  double y;

  factory CoordToAddress.fromJson(Map<String, dynamic> json) => CoordToAddress(
        regionType: json["region_type"],
        code: json["code"],
        addressName: json["address_name"],
        region1DepthName: json["region_1depth_name"],
        region2DepthName: json["region_2depth_name"],
        region3DepthName: json["region_3depth_name"],
        region4DepthName: json["region_4depth_name"],
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "region_type": regionType,
        "code": code,
        "address_name": addressName,
        "region_1depth_name": region1DepthName,
        "region_2depth_name": region2DepthName,
        "region_3depth_name": region3DepthName,
        "region_4depth_name": region4DepthName,
        "x": x,
        "y": y,
      };
}
