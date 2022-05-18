import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../Screen/Notiifcation/notificationScreen.dart';
class notification{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
Future <void>initaliazationnotification()async{
  final AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app');
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String ?payloafd)async{
  selectNotification(payloafd!);
  }
);
}
desplaynotification({String ?title , String ?body})async{
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('your channel id', 'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, title, body, platformChannelSpecifics,
     // payload: body
      );
}
  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.to(NotificatoinScreen(payload: payload,));

  }
}
//  const NotificationDetails platformChannelSpecifics =
//  NotificationDetails(android: androidPlatformChannelSpecifics);
//  await flutterLocalNotificationsPlugin.show(
//  0, 'plain title', 'plain body', platformChannelSpecifics,
//  payload: 'item x');
//  void onDidReceiveLocalNotification(
//      int ?id, String ?title, String ?body, String ?payload) async {
//    // display a dialog with the notification details, tap ok to go to another page
//    showDialog(
//      context: context,
//      builder: (BuildContext context) => CupertinoAlertDialog(
//        title: Text(title),
//        content: Text(body),
//        actions: [
//          CupertinoDialogAction(
//            isDefaultAction: true,
//            child: Text('Ok'),
//            onPressed: () async {
//              Navigator.of(context, rootNavigator: true).pop();
//              await Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => SecondScreen(payload),
//                ),
//              );
//            },
//          )
//        ],
//      ),
//    );
//}
