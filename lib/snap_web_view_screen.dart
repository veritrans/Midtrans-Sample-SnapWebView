import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SnapWebViewScreen extends StatefulWidget {
  static const routeName = '/snap-webview';

  const SnapWebViewScreen({Key? key}) : super(key: key);

  @override
  State<SnapWebViewScreen> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<SnapWebViewScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final url = routeArgs['url'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
