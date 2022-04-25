// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:real_app_2/models/room_profile.dart';
import 'package:real_app_2/models/room_profile_fetch.dart';
import 'package:real_app_2/models/room_profile_member.dart';
import 'package:real_app_2/utils/api_helper.dart';
import 'package:real_app_2/utils/dio.dart';

class RoomProfileController extends GetxController {
  static RoomProfileController get to => Get.find();

  RxBool isLoading = false.obs;
  var roomProfile = RoomProfileItem(
    title: '',
    description: '',
    pop: 0,
    subInteresting: '',
    gender: '',
    age: '',
    // minAge: 0,
    // maxAge: 0,
    locationTitle: '',
    expireRoomDate: 0,
    createdAt: '',
    roomThumbnail: '',
  ).obs;

  var roomProfileMember = <RoomProfileUserItems>[].obs;

  @override
  void onInit() async {
    await roomProfileHttp();

    super.onInit();
  }

  List<RoomProfileUserItems> roomMemberBangjang() {
    List<RoomProfileUserItems> member = roomProfileMember.value
        .where((data) => data.userType == 'bangjang')
        .toList();
    // List<RoomProfileUserItems> user = member.map((e) => RoomProfileUserItems.fromJson(e)).toList();
    // print(member[0].selfMessage);
    return member;
  }

  List<RoomProfileUserItems> roomMemberUser() {
    List<RoomProfileUserItems> member =
        roomProfileMember.where((data) => data.userType != 'bangjang').toList();
    // var user = member.map((e) => RoomProfileUserItems.fromJson(e)).toList();
    return member;
  }

  Future roomProfileHttp() async {
    isLoading(true);
    // var dio = await DioHttp().cacheDioModel();

    // var res = await dio.get(
    //   '/room/room_profile',
    //   queryParameters: {'id': Get.arguments['id']},
    // );
    final res = await ApiHelper.instance.get('/room/room_profile',
        queryParameters: {'id': Get.arguments['id']});

    if (res['code'] == 1) {
      final profile = RoomProfileFetch.fromJson(res['responseData']);
      var age;
      if (profile.minAge == profile.maxAge) {
        age = '${profile.minAge}대';
      } else if (profile.minAge == 10 && profile.maxAge == 50) {
        age = '전 연령';
      } else {
        age = '${profile.minAge}~${profile.maxAge}대';
      }

      final memberList = profile.member
          .map<RoomProfileUserItems>(
            (e) => RoomProfileUserItems(
              userType: e.userType,
              username: e.user.name,
              userGender: e.user.gender,
              userThumbnail: e.user.thumbnail.url,
            ),
          )
          .toList();
      // memberList.sort()

      roomProfile.update((val) {
        val!.createdAt = profile.createdAt;
        val.description = profile.description;
        val.expireRoomDate = profile.expireRoomDate;
        val.gender = profile.gender;
        val.locationTitle = profile.locationTitle;
        val.age = age;
        // val.maxAge = profile.maxAge;
        // //val.member = profile.member;
        // val.minAge = profile.minAge;
        val.pop = profile.pop;
        val.roomThumbnail = profile.roomThumbnail.url;
        val.subInteresting = profile.subInteresting;
        val.title = profile.title;
      });
      roomProfileMember.addAll(memberList);
      isLoading(false);
      print(roomProfileMember[0].userType);

      //print(roomProfile.value.age);
    }
    isLoading(false);
    return;
  }
}
