import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'notification_service.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Handling a background message: ${message.messageId}");
}

class PushNotificationService {
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  Future initialize() async {
    await fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // log("notification status: ${settings.}")

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        showNotification(message.notification!);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('on notifictaion opended');
      log('Message data: ${message.data}');
    });
  }

  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    log('Token: $token');
    return token;
  }
}
