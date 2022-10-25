import 'package:flutter/material.dart';

class SnapWebViewScreen extends StatelessWidget {
  static const routeName = '/snap-webview';

  const SnapWebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final url = routeArgs['url'];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Url: $url')
          ],
        ),
      ),
    );
  }
}
