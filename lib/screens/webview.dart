import 'package:flutter/material.dart';

class WebviewButtonPage extends StatefulWidget {
  const WebviewButtonPage({super.key});

  @override
  State<WebviewButtonPage> createState() => _WebviewButtonPageState();
}

class _WebviewButtonPageState extends State<WebviewButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview button Page'),
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/webviewcontainer');
            },
            child: const Text('click ')),
      )),
    );
  }
}
