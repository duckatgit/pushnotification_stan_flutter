import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('logo');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: DarwinInitializationSettings(
      onDidReceiveLocalNotification: (_, __, ___, ____) async {
        log('on onDidReceiveLocalNotification message');
      },
    ),
  );
  await FlutterLocalNotificationsPlugin().initialize(
    initializationSettings,
  );
}

Future<void> showNotification(RemoteNotification remoteNotification) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '0', 'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      icon: '@mipmap/ic_launcher');
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
    sound: "notificationCupcake.caf",
  );
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    remoteNotification.title,
    remoteNotification.body,
    platformChannelSpecifics,
  );
}
