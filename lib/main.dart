import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graph_app/screens/home/home_screen.dart';
import 'package:graph_app/theme/theme_manager.dart';

import 'firebase_options.dart';
import 'notification/notification_service.dart';
import 'notification/push_notification_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initNotifications();

  PushNotificationService().initialize();
  // PushNotificationService().getToken();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeManager().themeData,
      scaffoldMessengerKey: snackBarKey,
      home: const HomeScreen(),
    );
  }
}
