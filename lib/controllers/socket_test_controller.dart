import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:real_app_2/utils/api_helper.dart';
import 'package:real_app_2/utils/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';


class SocketTestController extends FullLifeCycleController
    with FullLifeCycleMixin {
  static SocketTestController get to => Get.find();

  Socket socket = io(
    'http://192.168.0.101:80/room',
    OptionBuilder().setTransports(['websocket']).build(),
  );

  var msgList = [].obs;
  RxString sub = ''.obs;

  @override
  void onInit() {
    onConnected();
    msgListen();
    print('init');
    super.onInit();
  }

  @override
  void onClose() {
    onDisConnected();
    print('close');
    // socket.onDisconnect((data) {
    //   print('disconnect');
    // });
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onDetached() {
    onConnected();
    print('detach');
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // onConnected();
    print('inactive');
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    onDisConnected();
    print('pause');
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // socket.onConnect((data) {
    //   print('connect');
    // });
    onConnected();
    print('resume');

    // TODO: implement onResumed
  }

  void onConnected() {
    socket.connect();
    socket.emit('join', 22);
    print('connect');
  }

  void onDisConnected() {
    socket.ondisconnect();
    print('disConnect');
  }

  void msgEmitted(data) {
    socket.emit('events', data);
  }

  void msgListen() {
    socket.on('events', (data) => msgList.add(data));
    socket.on('join', (data) => print(data));
  }

  // Future hivetest() async {
  //   // await Hive.openBox<HiveRoom>('room1');
  //   // final box = Hive.box('room1');

  //   // box.put(
  //   //     '1',
  //   //     HiveRoom(
  //   //         roomId: '1',
  //   //         title: 'title',
  //   //         roomType: 'roomType',
  //   //         expireDate: 1231,
  //   //         created_at: 'created_at'));

  //   // var hh = box.keys;
  // }

  void dioTest() async {
    var res = await ApiHelper.instance.get('/room/test');
    print(res);
    // var res = await DioHttp().defaultGetDioModel('/room/test');
    // print(res);
  }
}
