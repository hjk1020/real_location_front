import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:real_app_2/bindings/app_binding.dart';
import 'package:real_app_2/bindings/app_calendar.dart';
import 'package:real_app_2/bindings/chat_create_binding.dart';
import 'package:real_app_2/bindings/login_binding.dart';
import 'package:real_app_2/bindings/profile_binding.dart';
import 'package:real_app_2/bindings/profile_edit_binding.dart';
import 'package:real_app_2/bindings/signup_binding.dart';

import 'package:real_app_2/pages/app/app.dart';
import 'package:real_app_2/pages/app/app_calendar/app_calendar.dart';
import 'package:real_app_2/pages/app/app_calendar/app_calendar_add/app_calendar_add.dart';
import 'package:real_app_2/pages/chat/chat_create/chat_create.dart';
import 'package:real_app_2/pages/chat/chat_create_detail/chat_create_detail.dart';
import 'package:real_app_2/pages/chat/chat_create_location/chat_create_location.dart';
import 'package:real_app_2/pages/chat/chat_main/chat_main.dart';
import 'package:real_app_2/pages/chat/chat_room_body/chat_room_body.dart';
import 'package:real_app_2/pages/chat/room_profile/room_profile.dart';
import 'package:real_app_2/pages/community/community_main/community_main.dart';
import 'package:real_app_2/pages/drift_test.dart';
import 'package:real_app_2/pages/hive_test/hive_test.dart';
import 'package:real_app_2/pages/home/home_main/home_main.dart';
import 'package:real_app_2/pages/login/login_main/login_main.dart';
import 'package:real_app_2/pages/login/login_verify/login_verify.dart';
import 'package:real_app_2/pages/long_meet/long_meet_main/long_meet_main.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit_detail/profile_edit_detail.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit_detail_phone/profile_edit_detail_phone.dart';
import 'package:real_app_2/pages/profile/profile_edit/profile_edit_intro/profile_edit_intro.dart';
import 'package:real_app_2/pages/profile/profile_main/profile_main.dart';
import 'package:real_app_2/pages/profile/profile_main_self/profile_main_self.dart';
import 'package:real_app_2/pages/signup/signup_birth/signup_birth.dart';
import 'package:real_app_2/pages/signup/signup_gender/signup_gender.dart';
import 'package:real_app_2/pages/signup/signup_interesting/signup_interesting.dart';
import 'package:real_app_2/pages/signup/signup_location/signup_location.dart';
import 'package:real_app_2/pages/signup/signup_name/signup_name.dart';
import 'package:real_app_2/pages/signup/signup_profile_image/signup_profile_image.dart';
import 'package:real_app_2/pages/signup/signup_username/signup_username.dart';
import 'package:real_app_2/pages/socket_test.dart';
import 'package:real_app_2/test.dart';
import 'package:real_app_2/theme/theme.dart';
import 'package:real_app_2/utils/app_apth.dart';
import 'package:real_app_2/utils/dio.dart';
import 'package:real_app_2/utils/fcm.dart';

import 'bindings/app_calendar_add.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

// Future<void> backroundHandler(RemoteMessage message) async {
//   print(" This is message from background");
//   print(message.notification!.title);
//   print(message.notification!.body);
// }

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  final storage = new FlutterSecureStorage();

  await storage.write(key: 'mo', value: message.data['mo']);
  // var openBox = await Hive.openBox('')

  print("Handling a background message: ${message.messageId}");
  print('background main: ${message.notification!.body}');
  print('background main: ${message.data}');
}

var dio = Dio();
final firebaseMessaging = FCM();

void main() async {
  await GetStorage.init();
  await Hive.initFlutter();
  await AppPathProvider.initPath();

  // Hive.registerAdapter(HiveMessageAdapter());
  // await Hive.openBox<HiveMessage>('message');
  // Hive.registerAdapter(RoomMemberAdapter());
  // await Hive.openBox<RoomMember>('roomMember');
  // Hive.registerAdapter(HiveRoomAdapter());
  // await Hive.openBox<HiveRoom>('room');

  (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  firebaseMessaging.setNotifications();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final message = FirebaseMessaging.instance;

  void fcmFun() async {
    final storage = new FlutterSecureStorage();

    // var box = Hive.box('fcm');

    final token = await message.getToken();
    final exToken = await storage.read(key: 'fcmToken');

    final test = await storage.read(key: 'mo');
    print('mo test: ${test}');

    //print(box.get('fcm'))
    // message.onTokenRefresh.listen((event) { })
    if (token != exToken) {
      var dio = await DioHttp().authDio();
      var res = await dio
          .post('/auth/deviced_token_edit', data: {'deviced_id': token});
      if (res.data['code'] == 1) {
        await storage.write(key: 'fcmToken', value: token);
        await storage.write(
            key: 'accessToken',
            value: res.data['responseData']['access_token']);
        await storage.write(
            key: 'refreshToken',
            value: res.data['responseData']['refresh_token']);
      }
    }
  }

  @override
  void initState() {
    fcmFun();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme.copyWith(
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
      ),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [Locale('ko', 'KR')],
      debugShowCheckedModeBanner: false,
      initialRoute: '/drifttest',
      getPages: [
        GetPage(
            name: '/login_main',
            page: () => const LoginMain(),
            binding: LoginBinding()),
        GetPage(
            name: '/login_verify',
            page: () => const LoginVerify(),
            binding: LoginBinding()),
        GetPage(
            name: '/signup_name',
            page: () => const SignupName(),
            binding: SignupBinding()),
        GetPage(
            name: '/signup_username',
            page: () => const SignupUsername(),
            binding: SignupBinding()),
        GetPage(
            name: '/signup_birth',
            page: () => const SignupBirth(),
            binding: SignupBinding()),
        GetPage(
            name: '/signup_gender',
            page: () => const SignupGender(),
            binding: SignupBinding()),
        GetPage(
            name: '/signup_profile_image',
            page: () => const SignupProfileImage(),
            binding: SignupBinding()),
        GetPage(
            name: '/signup_interesting',
            page: () => const SignupInteresting(),
            binding: SignupBinding()),
        GetPage(
            name: '/signup_location',
            page: () => const SignupLocation(),
            binding: SignupBinding()),
        GetPage(name: '/app', page: () => const App(), binding: AppBinding()),
        GetPage(name: '/chat_main', page: () => const ChatMain()),
        GetPage(name: '/home_main', page: () => const HomeMain()),
        GetPage(name: '/long_meet_main', page: () => const LongMeetMain()),
        GetPage(
            name: '/profile_main_self',
            page: () => const ProfileMainSelf(),
            binding: ProfileBinding()),
        GetPage(
            name: '/profile_main',
            page: () => const ProfileMain(),
            binding: ProfileBinding()),
        GetPage(
            name: '/profile_edit',
            page: () => const ProfileEdit(),
            binding: ProfileEditBinding()),
        GetPage(
            name: '/profile_edit_detail_phone',
            page: () => const ProfileEditDetailPhone(),
            binding: ProfileEditBinding()),
        GetPage(
            name: '/profile_edit_detail',
            page: () => const ProfileEditDetail(),
            binding: ProfileEditBinding()),
        GetPage(
            name: '/profile_edit_intro',
            page: () => const ProfileEditIntro(),
            binding: ProfileEditBinding()),
        GetPage(
            name: '/profile_edit_intro',
            page: () => const ProfileEditIntro(),
            binding: ProfileEditBinding()),
        GetPage(
            name: '/chat_create',
            page: () => const ChatCreate(),
            binding: ChatCreateBinding()),
        GetPage(
            name: '/chat_create_detail',
            page: () => const ChatCreateDetail(),
            binding: ChatCreateBinding()),
        GetPage(
            name: '/chat_create_location',
            page: () => const ChatCreateLocation(),
            binding: ChatCreateBinding()),
        GetPage(name: '/chat_room_body', page: () => const ChatRoomBody()),
        GetPage(name: '/room_profile', page: () => const RoomProfile()),
        GetPage(
            name: '/app_calendar',
            page: () => const AppCalendar(),
            binding: AppCalendarBinding()),
        GetPage(
            name: '/app_calendar_add',
            page: () => const AppCalendarAdd(),
            binding: AppCalendarAddBinding()),
        GetPage(
          name: '/community_main',
          page: () => const CommunityMain(),
        ),
        GetPage(name: '/test', page: () => SocketTest()),
        GetPage(name: '/drifttest', page: () => DriftTest()),
      ],
    );
  }
}
