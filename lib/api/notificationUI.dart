import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Configure and initialize it
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Create a custom notification
const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
  'your_channel_id',
  'your_channel_name',
  importance: Importance.max,
  priority: Priority.high,
  showWhen: false,
);
const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

// Show the notification
