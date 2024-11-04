import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:graph_app/api/api_urls.dart';
import 'package:graph_app/notification/push_notification_service.dart';
import 'package:graph_app/utils/snackbar.dart';

Future sendToken() async {
  try {
    final dio = Dio();
    String token = await PushNotificationService().getToken() ?? '';
    log("token: $token");
    final response = await dio.post(
      ApiUrl.sendDeviceToken,
      data: {"token": token},
    );
    log(response.statusCode.toString());
    if (response.statusCode == 201) {
      showSnackBar(snackBarType: SnackBarType.success, content: "Success");
    } else {
      showSnackBar(
          snackBarType: SnackBarType.error, content: "Something went wrong");
    }
  } catch (e) {
    showSnackBar(snackBarType: SnackBarType.error, content: e.toString());
  }
}
