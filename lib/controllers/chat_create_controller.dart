import 'dart:io';

// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:real_app_2/bindings/chat_create_binding.dart';
import 'package:real_app_2/models/coord_to_address.dart';
import 'package:real_app_2/models/my_main_location.dart';
import 'package:real_app_2/models/room_create_data.dart';
import 'package:real_app_2/models/search_location_item_detail.dart';
import 'package:real_app_2/models/sub_interesting_items.dart';
import 'package:real_app_2/pages/chat/chat_create/chat_create.dart';
import 'package:real_app_2/pages/chat/chat_create/chat_create.dart';
import 'package:real_app_2/pages/chat/chat_create_location/chat_create_location.dart';
import 'package:real_app_2/theme/theme.dart';
import 'package:real_app_2/utils/api_helper.dart';
import 'package:real_app_2/utils/api_helper_auth.dart';
import 'package:real_app_2/utils/dio.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:permission_handler/permission_handler.dart' as per;
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart' as sdio;


class SampleLocation {
  String sampleLocationName;
  String sampleLocationX;
  String sampleLocationY;

  SampleLocation({
    required String sampleLocationName,
    required String sampleLocationX,
    required String sampleLocationY,
  })  : this.sampleLocationName = sampleLocationName,
        this.sampleLocationX = sampleLocationX,
        this.sampleLocationY = sampleLocationY;
}

class ChatCreateController extends GetxController {
  static ChatCreateController get to => Get.find();

  final TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  //final PagingController pagingController = PagingController(firstPageKey: 0);

  RxBool isLoading = false.obs;

  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  RxString title = ''.obs;
  RxString titleErrorText = ''.obs;
  RxString locationName = ''.obs;
  RxString locationX = ''.obs;
  RxString locationY = ''.obs;

  RxString interesting = ''.obs;
  RxString content = ''.obs;

  RxBool ageBool = false.obs;
  RxString ageRange = '전 연령'.obs;
  RxInt minAge = 10.obs;
  RxInt maxAge = 50.obs;
  final values = SfRangeValues(10.0, 50.0).obs;

  RxString gender = 'UNKNOWN'.obs;
  final genderList = [false, false, false].obs;

  // RxString topic = ''.obs;

  RxInt expiryTime = 20.obs;
  RxBool expiryTimeBool = false.obs;

  RxInt limitPerson = 10.obs;
  RxBool limitPersonBool = false.obs;

  // RxBool offlineMeetingBool = false.obs;
  // RxString offlineMeetingStart = ''.obs;
  // RxString offlineMeetingEnd = ''.obs;

  var myMainLocation = <MyMainLocation>[].obs;
  var subInterestingList = [].obs;

  RxList dong = [].obs;
  final dongSearchList = <SearchLocationItemsDetail>[].obs;
  final dongMySearchList = <CoordToAddress>[].obs;

  RxInt dongPage = 1.obs;
  RxBool dongLastPage = false.obs;
  RxString dongLocationQuery = ''.obs;
  var locationSample = SampleLocation(
          sampleLocationName: '', sampleLocationX: '', sampleLocationY: '')
      .obs;

  // var profileFile = File('').obs;

  File? profileFile;

  @override
  void onInit() async {
    await firstRoomCreateInfoHttp();
    await roomListHttp(); // 지울거
    debounce(title, validateTitle, time: const Duration(milliseconds: 500));
    debounce(dongLocationQuery, validatedDongLocationQuery,
        time: const Duration(milliseconds: 1000));
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          dongLastPage.value == false) {
        await locationQueryHttp(dongLocationQuery.value, dongPage.value);
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  // @override
  // void onClose() {
  //   pagingController.dispose();
  //   // scrollController.dispose();
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  void validateTitle(String t) {
    titleErrorText.value = '';
    if (t.isNotEmpty) {
      if (_titleTest(t)) {
        titleErrorText.value = '';
      }
    }
  }

  void changedTitle(String t) {
    title.value = t;
    print(title.value);
    print(titleErrorText.value);
  }

  bool _titleTest(String t) {
    if (t.length < 5) {
      titleErrorText.value = '5자 이상 적어 주십시오.';
      return false;
    }
    if (t == '     ') {
      titleErrorText.value = '공백이 5연속으로 쓰여질수 없습니다.';
      return false;
    }
    return true;
  }

  void changedAge(v) {
    values.value = v;
    minAge.value = v.start.toInt();
    maxAge.value = v.end.toInt();
    ageRange.value = v.start == v.end && v.start.toInt() == 50
        ? '${v.start.toInt()}대 이상'
        : v.start == v.end
            ? '${v.start.toInt()}대'
            : v.end.toInt() == 50
                ? v.start.toInt() == 10
                    ? '전 연령'
                    : '${v.start.toInt()} ~ ${v.end.toInt()}대 이상'
                : '${v.start.toInt()} ~ ${v.end.toInt()}대';
  }

  void changedGender(int index) {
    if (index == 0) {
      genderList.value[0] = true;
      genderList.value[1] = false;
      genderList.value[2] = false;
      gender.value = 'male';
    } else if (index == 1) {
      genderList.value[0] = false;
      genderList.value[1] = true;
      genderList.value[2] = false;
      gender.value = 'female';
    } else {
      genderList.value[0] = false;
      genderList.value[1] = false;
      genderList.value[2] = true;
      gender.value = 'none';
    }
  }

  void dongChipClick(int index) {
    locationName.value = myMainLocation.value[index].locationName;
    locationX.value = myMainLocation.value[index].x.toString();
    locationY.value = myMainLocation.value[index].y.toString();

    // locationSample.value.sampleLocationName =
    //     myMainLocation.value[index].locationName;
    // locationSample.value.sampleLocationX =
    //     myMainLocation.value[index].location.coordinates[0].toString();
    // locationSample.value.sampleLocationY =
    //     myMainLocation.value[index].location.coordinates[1].toString();
    Get.to(() => const ChatCreate(), binding: ChatCreateBinding());
  }

  void myLocationDataSearch() async {
    //queryClear();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    var x = _locationData!.longitude.toString();
    var y = _locationData!.latitude.toString();
    locationX.value = x;
    locationY.value = y;
    // locationSample.value.sampleLocationX = x;
    // locationSample.value.sampleLocationY = y;
    await myLocationSearchHttp(x, y);
    locationName.value = dongMySearchList.value[0].addressName;

    // locationSample.value.sampleLocationName =
    //     dongMySearchList.value[0].addressName;
    //  '${dongMySearchList.value[0].structure.level1} ${dongMySearchList.value[0].structure.level2} ${dongMySearchList.value[0].structure.level4L}';
    Get.to(() => const ChatCreate(), binding: ChatCreateBinding());
  }

  void validatedDongLocationQuery(String q) async {
    const pattern = r'^[가-힣]*$';
    RegExp regExp = RegExp(pattern);

    dongPage.value = 1;
    dongLastPage.value = false;

    if (q.length > 1 && q.length < 7) {
      if (regExp.hasMatch(q)) {
        dongSearchList.clear();

        await locationQueryHttp(q, dongPage.value);
      }
    }
  }

  void dongOnSelect(int index) {
    locationName.value =
        dongSearchList.value[index].documents.address.addressName;
    locationX.value = dongSearchList.value[index].documents.x;
    locationY.value = dongSearchList.value[index].documents.y;

    // locationSample.value.sampleLocationName =
    //     dongSearchList.value[index].documents.address.addressName;

    // locationSample.value.sampleLocationX =
    //     dongSearchList.value[index].documents.x;
    // locationSample.value.sampleLocationY =
    //     dongSearchList.value[index].documents.y;
    dongSearchList.clear();

    Get.to(() => const ChatCreate(), binding: ChatCreateBinding());
  }

  Future galleryImage() async {
    var imageStatus = await per.Permission.photos.status;
    // Permission.photos.status;
    print(imageStatus);
    if (imageStatus.isGranted || imageStatus.isLimited) {
      _gallery();
    } else {
      Map<per.Permission, per.PermissionStatus> status =
          await [per.Permission.photos].request();
      if (status[per.Permission.photos] == per.PermissionStatus.granted ||
          status[per.Permission.photos] == per.PermissionStatus.limited) {
        _gallery();
      } else {
        per.openAppSettings();
      }
    }
  }

  Future _gallery() async {
    final ImagePicker _picker = ImagePicker();

    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }
    final ext = p.extension(pickedFile.path);
    if (ext == '.heic' || ext == '.heif') {
      await HeicToJpg.convert(pickedFile.path);
    }

    final cropImage = await _cropImage(pickedFile);
    if (cropImage == null) {
      return;
    }
    profileFile = cropImage;
    // print(profileFile);
    update();
  }

  Future _cropImage(XFile file) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: file.path,
      compressFormat: ImageCompressFormat.jpg,
      aspectRatio: CropAspectRatio(ratioX: 16.0, ratioY: 9.0),
      // aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
      //cropStyle: CropStyle.values,
      maxHeight: 594,
      maxWidth: 1056,
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: '이미지 자르기',
        toolbarColor: AppColor.primary,
        toolbarWidgetColor: AppColor.white,
        initAspectRatio: CropAspectRatioPreset.ratio16x9,
        //lockAspectRatio: true,
        //hideBottomControls: true,
      ),
      iosUiSettings: const IOSUiSettings(
        //minimumAspectRatio: 1.0,
        aspectRatioLockEnabled: true,
        resetButtonHidden: true,
        rotateButtonsHidden: true,
        aspectRatioPickerButtonHidden: true,
        doneButtonTitle: '완료',
        cancelButtonTitle: '취소',
      ),
    );
    return croppedFile;
  }

  void imageDelete() {
    profileFile = null;
    print(profileFile);
    update();
  }

  Future firstRoomCreateInfoHttp() async {
    isLoading(true);
    // var dio = await DioHttp().authDio();

    // var res = await dio.get('/room/room_create_first_info');
    final res =
        await ApiHelperAuth.instance.get('/room/room_create_first_info');
    List locationItems = res['location'];
    List subInterItems = res['sub_interesting'];

    // final subInterList = subInterItems
    //     .map<SubInterestingItems>((e) => SubInterestingItems.fromJson(e))
    //     .toList();

    subInterestingList.addAll(subInterItems);

    final locationList = locationItems
        .map<MyMainLocation>((e) => MyMainLocation.fromJson(e))
        .toList();
    myMainLocation.addAll(locationList);
    // final main = locationList.where((e) => e.permission == 'MAIN').toList();
    // locationName.value = main[0].locationName;
    // locationX.value = main[0].location.coordinates[0].toString();
    // locationY.value = main[0].location.coordinates[1].toString();
    // locationSample.value.sampleLocationName = main[0].locationName;
    // locationSample.value.sampleLocationX =
    //     main[0].location.coordinates[0].toString();
    // locationSample.value.sampleLocationY =
    //     main[0].location.coordinates[1].toString();

    final dongList =
        locationList.map((e) => e.locationName.split(' ').last).toList();
    dong.addAll(dongList);
    print(myMainLocation.value[0].locationName);

    isLoading(false);
  }

  Future roomCreateHttp() async {
    isLoading(true);
    //var dio = await DioHttp().authDio();
    if (interesting.value.isEmpty) {
      interesting.value = subInterestingList.value[0];
    }
    if (locationX.value.isEmpty) {
      final where =
          myMainLocation.where((e) => e.permission == 'MAIN').toList();
      locationX.value = where[0].x.toString();
      locationY.value = where[0].y.toString();
    }
    var formDate = sdio.FormData.fromMap({
      'title': title.value,
      'limit_people': limitPerson.value,
      'description': content.value,
      'gender': gender.value,
      'sub_interesting': interesting.value,
      'min_age': minAge.value,
      'max_age': maxAge.value,
      'address_name': locationName.value,
      'x': locationX.value,
      'y': locationY.value,
      'expire_time': expiryTime.value,
      'file': profileFile == null
          ? null
          : await sdio.MultipartFile.fromFile(
              profileFile!.path,
              filename: p.basename(profileFile!.path),
            ),
    });
    //  var res = await dio.post('/room/create_room', data: formDate);
    final res =
        await ApiHelperAuth.instance.post('/room/create_room', data: formDate);
    if (res['code'] == 1) {
      isLoading(false);
      // var roomBox = await Hive.openBox<HiveRoom>('room');
      // var memberBox = await Hive.openBox<RoomMember>('roomMember');
      //roomBox.put(key, value)
      // roomBox.put(
      //     'key',
      //     HiveRoom(
      //         roomId: '1',
      //         title: 'title',
      //         roomType: 'roomType',
      //         expireDate: 15));
      var craData = RoomCreateData.fromJson(res['responseData']);
      // roomBox.put(
      //   'room:${craData.roomId}',
      //   HiveRoom(
      //     roomId: craData.roomId,
      //     title: craData.roomTitle,
      //     roomType: craData.roomType,
      //   ),
      // );
      // memberBox.put('room');

      print(res['responseData']['user_id'].runtimeType);
      print(craData.roomId);
      print('성공');
      return;
    }
    isLoading(false);
    print('실패');
    return;
  }

  Future myLocationSearchHttp(String x, String y) async {
    isLoading(true);
    // final res = await DioHttp()
    //     .getQueryDioModel('/location/coord_to_address', {'x': x, 'y': y});
    final res = await ApiHelper.instance
        .get('/location/coord_to_address', queryParameters: {'x': x, 'y': y});

    if (res['code'] == 1) {
      List items = res["responseData"];

      final list =
          items.map<CoordToAddress>((u) => CoordToAddress.fromJson(u)).toList();

      isLoading(false);
      dongMySearchList.addAll(list);
    }
  }

  Future locationQueryHttp(String q, int p) async {
    isLoading(true);

    // final res = await DioHttp()
    //     .getQueryDioModel('/location/search_address', {'query': q, 'page': p});
    final res = await ApiHelper.instance.get('/location/search_address',
        queryParameters: {'query': q, 'page': p});

    // final items = SearchLocationItem.fromJson(res);

    if (res['code'] == 1) {
      //List items = res["responseData"]["result"]["items"];
      // final list = items
      //     .map<SearchLocationItem>((u) => SearchLocationItem.fromJson(u))
      //     .toList();
      List items = res['responseData'];
      final list = items
          .map<SearchLocationItemsDetail>(
              (e) => SearchLocationItemsDetail.fromJson(e))
          .toList();
      // print(items.code);
      // print(items.responseData[0].isEnd);
      // print(items.responseData[0].documents.address.addressName);
      // isLoading(false);
      dongPage.value++;
      isLoading(false);

      dongSearchList.addAll(list);
      // print(locationList.value[0].isEnd);
      // print(locationList.value[0].documents.address.addressName);
    } else {
      isLoading(false);
      dongLastPage(true);
      return;
    }
  }

  Future roomListHttp() async {
    isLoading(true);
    //var dio = await DioHttp().authDio();

    // var res = await dio.get(
    //   '/room/default_room_list',
    //   queryParameters: {'page': 1},
    //   // options: buildCacheOptions(Duration(days: 7)),
    // );
    final res = await ApiHelperAuth.instance
        .get('/room/default_room_list', queryParameters: {'page': 1});
    if (res['code'] == 1) {
      // List list = res.data['responseData'];
      // var map =
      //     list.map<RoomListItems>((e) => RoomListItems.fromJson(e)).toList();
      // defaultRoomList.addAll(map);
      // print(map);
      // print(defaultRoomList.value[0].locationTitle);
      // print(res.data['code']);
      // print(res.data['code']);
      isLoading(false);
    } else {
      isLoading(false);
      return;
    }
  }

//   Future chatCreateInfo() async {
//     final res = await DioHttp().authDio();

//   }
}
