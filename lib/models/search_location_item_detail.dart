class SearchLocationItemsDetail {
  SearchLocationItemsDetail({
    required this.documents,
    required this.isEnd,
  });

  Documents documents;
  bool isEnd;

  factory SearchLocationItemsDetail.fromJson(Map<String, dynamic> json) =>
      SearchLocationItemsDetail(
        documents: Documents.fromJson(json["documents"]),
        isEnd: json["is_end"],
      );

  Map<String, dynamic> toJson() => {
        "documents": documents.toJson(),
        "is_end": isEnd,
      };
}

class Documents {
  Documents({
    required this.address,
    required this.addressName,
    required this.addressType,
    required this.roadAddress,
    required this.x,
    required this.y,
  });

  Address address;
  String addressName;
  String addressType;
  dynamic roadAddress;
  String x;
  String y;

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
        address: Address.fromJson(json["address"]),
        addressName: json["address_name"],
        addressType: json["address_type"],
        roadAddress: json["road_address"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "address_name": addressName,
        "address_type": addressType,
        "road_address": roadAddress,
        "x": x,
        "y": y,
      };
}

class Address {
  Address({
    required this.addressName,
    required this.bCode,
    required this.hCode,
    required this.mainAddressNo,
    required this.mountainYn,
    required this.region1DepthName,
    required this.region2DepthName,
    required this.region3DepthHName,
    required this.region3DepthName,
    required this.subAddressNo,
    required this.x,
    required this.y,
  });

  String addressName;
  String bCode;
  String hCode;
  String mainAddressNo;
  String mountainYn;
  String region1DepthName;
  String region2DepthName;
  String region3DepthHName;
  String region3DepthName;
  String subAddressNo;
  String x;
  String y;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressName: json["address_name"],
        bCode: json["b_code"],
        hCode: json["h_code"],
        mainAddressNo: json["main_address_no"],
        mountainYn: json["mountain_yn"],
        region1DepthName: json["region_1depth_name"],
        region2DepthName: json["region_2depth_name"],
        region3DepthHName: json["region_3depth_h_name"],
        region3DepthName: json["region_3depth_name"],
        subAddressNo: json["sub_address_no"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "address_name": addressName,
        "b_code": bCode,
        "h_code": hCode,
        "main_address_no": mainAddressNo,
        "mountain_yn": mountainYn,
        "region_1depth_name": region1DepthName,
        "region_2depth_name": region2DepthName,
        "region_3depth_h_name": region3DepthHName,
        "region_3depth_name": region3DepthName,
        "sub_address_no": subAddressNo,
        "x": x,
        "y": y,
      };
}
