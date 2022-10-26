import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snap_webview/input_url_screen.dart';
import 'package:snap_webview/snap_web_view_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const InputUrlScreen(),
        SnapWebViewScreen.routeName: (ctx) => SnapWebViewScreen(controller: controller),
      },
    );
  }
}
