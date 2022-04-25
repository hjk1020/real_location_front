import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as per;
import 'package:real_app_2/bindings/app_binding.dart';
import 'package:real_app_2/bindings/signup_binding.dart';
import 'package:real_app_2/models/coord_to_address.dart';
import 'package:real_app_2/models/search_location_item_detail.dart';
import 'package:real_app_2/pages/app/app.dart';
import 'package:real_app_2/pages/login/login_main/login_main.dart';
import 'package:real_app_2/pages/signup/signup_gender/signup_gender.dart';
import 'package:real_app_2/theme/theme.dart';

import 'package:path/path.dart' as p;
import 'package:real_app_2/utils/api_helper.dart';
import 'package:real_app_2/utils/dio.dart';
import 'package:dio/dio.dart' as dio;

class SignupController extends GetxController {
  static SignupController get to => Get.find();

  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  TextEditingController textEditingController = TextEditingController();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController usernameTextEditingController = TextEditingController();

  var scrollController = ScrollController().obs;

  RxBool isLoading = false.obs;

  RxString phoneNumber = ''.obs;
  RxString name = ''.obs;
  RxString nameErrorText = ''.obs;

  RxString username = ''.obs;
  RxString usernameErrorText = ''.obs;

  RxString birth = ''.obs;
  RxString gender = 'UNKNOWN'.obs;

  final defaultInteresting = RxMap().obs;
  final interesting = RxList<String?>([]);

  RxInt page = 1.obs;
  RxBool lastpage = false.obs;

  RxString selfLocationX = ''.obs;
  RxString selfLocationY = ''.obs;
  RxString selfLocationName = ''.obs;

  RxString locationQuery = ''.obs;

  final locationList = <SearchLocationItemsDetail>[].obs;
  final myLocationSearchList = <CoordToAddress>[].obs;
  RxString locationName = ''.obs;
  RxString locationX = ''.obs;
  RxString locationY = ''.obs;
  RxString fcmToken = ''.obs;

  RxBool agree1 = false.obs;
  RxBool agree2 = false.obs;
  RxBool agree3 = false.obs;
  RxBool agree4 = false.obs;
  RxBool agree5 = false.obs;

  File? profileFile;

  @override
  void onInit() async {
    await interestingHttp();
    debounce(name, validateName, time: const Duration(milliseconds: 500));
    debounce(locationQuery, validatedLocationQuery,
        time: const Duration(milliseconds: 1000));
    debounce(username, validateUsername,
        time: const Duration(milliseconds: 500));
    scrollController.value.addListener(() async {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          lastpage.value == false) {
        await locationQueryHttp(locationQuery.value, page.value);
      }
    });
    super.onInit();
  }

  void testToken() async {
    var token = await messaging.getToken();
    print(token);
  }

  void validateName(String n) {
    nameErrorText.value = '';
    if (n.isNotEmpty) {
      if (_nameTest(n)) {
        nameErrorText.value = '';
      }
    }
  }

  void clearName() {
    name.value = '';
    nameTextEditingController.clear();
  }

  bool _nameTest(String n) {
    const pattern = r'^[가-힣a-zA-Z0-9_]*$';
    const space = r'\s';
    RegExp regExp = RegExp(pattern);
    RegExp regExpSpace = RegExp(space);
    if (n.isEmpty) {
      nameErrorText.value = '이름을 적어주세요';
      return false;
    } else if (regExpSpace.hasMatch(n)) {
      nameErrorText.value = '공백이 있습니다. 공백을 지워주세요.';
      return false;
    } else if (!regExp.hasMatch(n)) {
      nameErrorText.value = '한글, 영대소문자, 숫자, _, 만 입력 가능합니다.';
      return false;
    } else if (n.length < 2 || n.length > 10) {
      nameErrorText.value = '이름은 2자에서 10자 사이입니다.';
      return false;
    }
    return true;
  }

  void nameChanged(String n) {
    name.value = n;
  }

  void clearUsername() {
    username.value = '';
    usernameTextEditingController.clear();
  }

  void usernameChanged(String u) {
    username.value = u;
  }

  void validateUsername(String u) async {
    usernameErrorText.value = '';
    if (u.isNotEmpty) {
      if (_usernameTest(u)) {
        usernameErrorText.value = '';
      }
    }
  }

  void validateFinalUsername() async {
    usernameErrorText.value = '';
    if (_usernameTest(username.value) && await _duUsername(username.value)) {
      usernameErrorText.value = '';
      print(phoneNumber.value);
      print(name.value);
      Get.to(() => const SignupGender(), binding: SignupBinding());
    }
  }

  bool _usernameTest(String u) {
    const pattern = r'^[a-zA-Z0-9._-]*$';
    const space = r'\s';

    RegExp regExp = RegExp(pattern);
    RegExp regExpSpace = RegExp(space);

    if (u.isEmpty) {
      usernameErrorText.value = '사용자 이름을 적어주세요.';
      return false;
    } else if (regExpSpace.hasMatch(u)) {
      usernameErrorText.value = '공백이 있습니다. 공백을 지워주세요.';
      return false;
    } else if (!regExp.hasMatch(u)) {
      usernameErrorText.value = '영대소문자, 숫자, _, 만 적을 수 있습니다.';
      return false;
    } else if (u.length < 2 || u.length > 10) {
      usernameErrorText.value = '사용자 이름은 2자에서 10자 사이입니다.';
      return false;
    }
    return true;
  }

  Future _duUsername(String u) async {
    isLoading(true);
    final res = await DioHttp()
        .defaultPostDioModel('/auth/du_username', {"username": u});
    if (res["code"] == 10) {
      usernameErrorText.value = '중복되는 사용자 이름이 있습니다.';
      isLoading(false);
      return false;
    } else if (res["code"] == 1) {
      isLoading(false);
      //Get.to(() => const SignupGender(), binding: SignupBinding());
      return true;
    }
    isLoading(false);
    return false;
  }

  void birthChanged(v) {
    birth(DateFormat('yyyy-MM-dd').format(v));
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

  Future cameraImage() async {
    var cameraStatus = await per.Permission.camera.status;
    if (cameraStatus.isGranted) {
      _camera();
    } else {
      Map<per.Permission, per.PermissionStatus> status =
          await [per.Permission.camera].request();

      if (status[per.Permission.camera] == per.PermissionStatus.granted) {
        _camera();
      } else {
        per.openAppSettings();
      }
    }
  }

  Future _camera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? camera = await _picker.pickImage(source: ImageSource.camera);
    // await ImagePicker.platform.pickImage(source: ImageSource.camera);
    final ext = p.extension(camera!.path);
    if (ext == '.heic' || ext == '.heif') {
      await HeicToJpg.convert(camera.path);
    }
    if (camera == null) return;

    final cropImage = await _cropImage(camera);
    if (cropImage == null) return;
    profileFile = cropImage;
    update();
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
    update();
  }

  Future _cropImage(XFile file) async {
    File? croppedFile = await ImageCropper.cropImage(
      sourcePath: file.path,
      compressFormat: ImageCompressFormat.jpg,
      cropStyle: CropStyle.circle,
      maxHeight: 250,
      maxWidth: 250,
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: '이미지 자르기',
        toolbarColor: AppColor.primary,
        toolbarWidgetColor: AppColor.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
        hideBottomControls: true,
      ),
      iosUiSettings: const IOSUiSettings(
        minimumAspectRatio: 1.0,
        aspectRatioLockEnabled: true,
        resetButtonHidden: true,
        aspectRatioPickerButtonHidden: true,
        doneButtonTitle: '완료',
        cancelButtonTitle: '취소',
      ),
    );
    return croppedFile;
  }

  void interestingController(bool selected, String value) {
    print(interesting.value);
    if (selected) {
      if (interesting.length > 10) {
        print('10개 이상');
      } else {
        interesting.add(value);
      }
    } else {
      interesting.remove(value);
    }
  }

  void onSelected(int index) {
    locationName.value =
        locationList.value[index].documents.address.addressName;
    locationX.value = locationList.value[index].documents.x;
    locationY.value = locationList.value[index].documents.y;
  }

  void myLocationDataSearch() async {
    queryClear();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    // print(_permissionGranted);
    // print(_serviceEnabled);
    if (_permissionGranted == PermissionStatus.denied) {
      //per.openAppSettings();
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    var x = _locationData!.longitude.toString();
    var y = _locationData!.latitude.toString();
    //print(x);
    selfLocationX.value = x;
    selfLocationY.value = y;
    await myLocationSearchHttp(x, y);
    selfLocationName.value = myLocationSearchList.value[0].addressName;
    //'${myLocationSearchList.value[0].structure.level1} ${myLocationSearchList.value[0].structure.level2} ${myLocationSearchList.value[0].structure.level4L}';
    // print(locationName.value);
  }

  void selectedMyLocationTrue() {
    locationX.value = selfLocationX.value;
    locationY.value = selfLocationY.value;
    locationName.value = selfLocationName.value;
  }

  void selectedMyLocationFalse() {
    locationX.value = '';
    locationY.value = '';
    locationName.value = '';
  }

  void validatedLocationQuery(String q) async {
    const pattern = r'^[가-힣]*$';
    RegExp regExp = RegExp(pattern);

    page.value = 1;
    lastpage.value = false;
    // locationList.clear();
    print(page.value);
    print(q);
    if (q.length > 1 && q.length < 7) {
      // print(locationQuery.value);
      if (regExp.hasMatch(q)) {
        //  print(q);
        locationList.clear();
        myLocationSearchList.clear();

        await locationQueryHttp(q, page.value);
      }
    }
  }

  void queryClear() {
    Future.delayed(const Duration(milliseconds: 500));
    page.value = 1;
    locationName.value = '';
    locationX.value = '';
    locationY.value = '';
    selfLocationX.value = '';
    selfLocationY.value = '';
    selfLocationName.value = '';
    textEditingController.clear();
    locationList.clear();
    myLocationSearchList.clear();
    locationQuery.value = '';
  }

  void agree1Fun(v) {
    agree1.value = !agree1.value;
    if (agree1.value && agree2.value && agree3.value && agree4.value) {
      agree5.value = true;
    } else {
      agree5.value = false;
    }
  }

  void agree2Fun(v) {
    agree2.value = !agree2.value;
    if (agree1.value && agree2.value && agree3.value && agree4.value) {
      agree5.value = true;
    } else {
      agree5.value = false;
    }
  }

  void agree3Fun(v) {
    agree3.value = !agree3.value;
    if (agree1.value && agree2.value && agree3.value && agree4.value) {
      agree5.value = true;
    } else {
      agree5.value = false;
    }
  }

  void agree4Fun(v) {
    agree4.value = !agree4.value;
    if (agree1.value && agree2.value && agree3.value && agree4.value) {
      agree5.value = true;
    } else {
      agree5.value = false;
    }
  }

  void allAgree(v) {
    if (agree5.value == false) {
      agree1.value = true;
      agree2.value = true;
      agree3.value = true;
      agree4.value = true;
      agree5.value = true;
    } else {
      agree1.value = false;
      agree2.value = false;
      agree3.value = false;
      agree4.value = false;
      agree5.value = false;
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
      page.value++;
      isLoading(false);

      locationList.addAll(list);
      // print(locationList.value[0].isEnd);
      // print(locationList.value[0].documents.address.addressName);
    } else {
      isLoading(false);
      lastpage(true);
      return;
    }
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
      myLocationSearchList.addAll(list);
    }
  }

  Future interestingHttp() async {
    // final res = await DioHttp().defaultGetDioModel('/auth/interesting');
    final res = await ApiHelper.instance.get('/auth/interesting');
    //print(res);
    defaultInteresting.value.addAll(res);
    // print(defaultInteresting.value.length);
    // print(defaultInteresting.value.keys.toList());
    // print(defaultInteresting.value[defaultInteresting.value.keys.toList()[0]]);

    // Get.arguments['phoneNumber'] = phoneNumber.value;
    // print(defaultInteresting.value[0].keys);

    // print(Get.arguments['phoneNumber']);
    // print(phoneNumber.value);
  }

  Future getToken() async {
    try {
      String? token = await messaging.getToken();
      fcmToken.value = '$token';
    } catch (e) {
      _flutterToast('다시 한번 눌러주세요.');
    }
  }

  Future signupUser() async {
    isLoading(true);
    var formData = dio.FormData.fromMap({
      'phone_number': phoneNumber.value,
      'name': name.value,
      'username': username.value,
      'gender': gender.value,
      'birth': birth.value,
      'x': locationX.value,
      'y': locationY.value,
      'location_name': locationName.value,
      'deviced_id': fcmToken.value,
      'file': await dio.MultipartFile.fromFile(
        profileFile!.path,
        filename: p.basename(profileFile!.path),
      ),
      'insteresting': List.from(interesting.value),
      // 'main_interesting': List.from(mainInteresting.value),
      // 'sub_interesting': List.from(subInteresting.value)
    });
    // final res = await DioHttp().defaultPostDioModel('/auth/create', formData);
    final res = await ApiHelper.instance.post('/auth/create', data: formData);
    if (res["code"] == 12 ||
        res["code"] == 10 ||
        res["code"] == 11 ||
        res["code"] == 13) {
      isLoading(false);
      Get.offAll(() => const LoginMain());
    } else if (res["code"] == 1) {
      isLoading(false);
      final storage = new FlutterSecureStorage();
      await storage.write(
          key: 'accessToken', value: res["responseData"]["access_token"]);
      await storage.write(
          key: 'refreshToken', value: res["responseData"]["refresh_token"]);
      await storage.write(key: 'fcmToken', value: fcmToken.value);

      Get.offAll(() => const App(), binding: AppBinding());
      print(await storage.read(key: 'accessToken'));
    }
    isLoading(false);
  }

  void _flutterToast(String msg) async {
    await Future.delayed(const Duration(seconds: 1));
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
