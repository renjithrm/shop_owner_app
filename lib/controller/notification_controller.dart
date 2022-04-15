import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:native_notify/native_notify.dart';

class NotificationController extends GetxController {
  final _dio = Dio();

  NotificationController() {
    _dio.options = BaseOptions(
      contentType: 'application/json',
    );
  }

  Future sentNotification(
      {required String userId,
      required String title,
      required String body}) async {
    log(userId);
    var response =
        _dio.post("https://app.nativenotify.com/api/flutter/notification",
            data: jsonEncode({
              'indieSubID': userId,
              'flutterAppId': '519',
              'flutterAppToken': 'VqJUy7sfjvcktZBNbXLo5o',
              'title': title,
              'body': body,
              'bigPictureURL': null,
              'data': null,
            }));
    print(response);
  }

  void yourIndiePushSendingFunction(
      {required String userId, required String title, required String body}) {
    print("userId:::::$userId");
    NativeNotify.sendIndieNotification(
        519, 'VqJUy7sfjvcktZBNbXLo5o', userId, title, body, null, null);
    // yourAppID, yourAppToken, 'your_sub_id', 'your_title', 'your_body' is required
    // put null in any other parameter you do NOT want to use
  }
}
