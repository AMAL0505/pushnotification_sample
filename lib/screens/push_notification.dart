import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationTest extends StatefulWidget {
  const PushNotificationTest({super.key});

  @override
  State<PushNotificationTest> createState() => _PushNotificationTestState();
}

class _PushNotificationTestState extends State<PushNotificationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push notification'),
      ),
      body: const Text('This is a sample pushnotification page'),
    );
  }
}
