import 'package:flutter/material.dart';
import 'package:snap_webview/input_url_screen.dart';
import 'package:snap_webview/snap_web_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        SnapWebViewScreen.routeName: (ctx) => const SnapWebViewScreen(),
      },
    );
  }
}
