import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.data.containsKey('data')) {
    final data = message.data['data'];
    print('onBackgroundMessageData: $data');
  }
  if (message.data.containsKey('notification')) {
    // Handle notification message
    final notification = message.data['notification'];
    print('onBackgroundMessageNoti: $notification');
  }

  print('onBackgroundNoti: ${message.notification!.title}');
  print('onBackgroundData: ${message.data}');
}

class FCM {
  final messaging = FirebaseMessaging.instance;

//   NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   announcement: false,
//   badge: true,
//   carPlay: false,
//   criticalAlert: false,
//   provisional: false,
//   sound: true,
// );

  // NotificationSettings settings = await messaging.requestPermission();

  setNotifications() async {
    print('fcm 시작');

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    // handle when app in active state
    forgroundNotification();

    // handle when app running in background state
    backgroundNotification();

    // handle when app completely closed by the user
    terminateNotification();

    // With this token you can test it easily on your phone
    final token = messaging.getToken().then((value) => print('Token: $value'));
  }

  forgroundNotification() {
    FirebaseMessaging.onMessage.listen(
      (message) async {
        if (message.data.containsKey('data')) {
          // Handle data message
          // streamCtlr.sink.add(message.data['data']);
          print('forgroundNotificationData: ${message.data['data']}');
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          // streamCtlr.sink.add(message.data['notification']);
          print('forgroundNotificationNoti: ${message.data['notification']}');
        }
        // Or do other work.

        print('forground: ${message.notification!.title!}');
        print('forground: ${message.data}');
        // titleCtlr.sink.add(message.notification!.title!);
        // bodyCtlr.sink.add(message.notification!.body!);
      },
    ).onData((data) {
      print('forgroundData: ${data.data}');
    });
  }

  backgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) async {
        if (message.data.containsKey('data')) {
          // Handle data message
          //streamCtlr.sink.add(message.data['data']);
          print('backgroundNotificationData: ${message.data['data']}');
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          // streamCtlr.sink.add(message.data['notification']);
          print('backgroundNotificationNoti: ${message.data['notification']}');
        }
        // Or do other work.
        print('background: ${message.notification!.title!}');
        print('background: ${message.data}');
      },
    );
  }

  terminateNotification() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      if (initialMessage.data.containsKey('data')) {
        // // Handle data message
        // streamCtlr.sink.add(initialMessage.data['data']);
        print('terminateNotificationData: ${initialMessage.data['data']}');
      }
      if (initialMessage.data.containsKey('notification')) {
        // Handle notification message
        // streamCtlr.sink.add(initialMessage.data['notification']);
        print(
            'terminateNotificationNoti: ${initialMessage.data['notification']}');
      }
      // Or do other work.
      // titleCtlr.sink.add(initialMessage.notification!.title!);
      // bodyCtlr.sink.add(initialMessage.notification!.body!);
      print('terminated: ${initialMessage.notification!.title!}');
      print('terminated: ${initialMessage.data}');
    }
  }
}
