import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pushnotification/api/firebase_api.dart';
import 'package:pushnotification/api/notificationUI.dart';
import 'package:pushnotification/firebase_options.dart';
import 'package:pushnotification/screens/push_notification.dart';
import 'package:pushnotification/screens/webview.dart';
import 'package:pushnotification/screens/webview_container.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

Future<void> _handleBackGroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some Notification Received");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().init();
  FirebaseApi().localnotinit();
  FirebaseMessaging.onBackgroundMessage(_handleBackGroundMessage);
  //foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("got a message in foreground");
    if (message.notification != null) {
      FirebaseApi().showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //'/': (context) => const PushNotificationTest(),
        '/': (context) => const WebviewButtonPage(),
        '/webviewcontainer': (context) => const WebViewContainer(),
      },
      initialRoute: '/',
    );
  }
}
