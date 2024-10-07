import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_saver/file_saver.dart';

class SnapWebViewScreen extends StatefulWidget {
  static const routeName = '/snap-webview';

  const SnapWebViewScreen({Key? key}) : super(key: key);

  @override
  State<SnapWebViewScreen> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<SnapWebViewScreen> {
  int loadingPercentage = 0;
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final url = routeArgs['url'];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: WebView(
                initialUrl: url,
                onPageStarted: (url) {
                  setState(() {
                    loadingPercentage = 0;
                  });
                },
                onProgress: (progress) {
                  setState(() {
                    loadingPercentage = progress;
                  });
                },
                onPageFinished: (url) {
                  setState(() {
                    loadingPercentage = 100;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
                javascriptChannels: <JavascriptChannel>{
                  _blobDataChannel(context),
                },
                navigationDelegate: (NavigationRequest request) {
                  final host = Uri.parse(request.url).toString();
                  if (host.contains('gojek://') ||
                      host.contains('shopeeid://') ||
                      host.contains('//wsa.wallet.airpay.co.id/') ||
                      // This is handle for sandbox Simulator
                      host.contains('/gopay/partner/') ||
                      host.contains('/shopeepay/') ||
                      host.contains('/pdf')) {
                    _launchInExternalBrowser(Uri.parse(request.url));
                    return NavigationDecision.prevent;
                  }
                  if (host.startsWith('blob:')) {
                    _fetchBlobData(request.url);
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 30,
              width: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A2852),
                  ),
                  child: const Text('Exit', style: TextStyle(fontSize: 10))),
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInExternalBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  JavascriptChannel _blobDataChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'BlobDataChannel',
      onMessageReceived: (JavascriptMessage message) async {
        final decodedBytes = base64Decode(message.message);
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;
        final file = File('$path/export.csv');
        await file.writeAsBytes(decodedBytes);

        await FileSaver.instance.saveAs(
          name: 'export',
          ext: 'png',
          mimeType: MimeType.png,
          file: file,
        );
      },
    );
  }

  void _fetchBlobData(String blobUrl) async {
    final script = '''
      (async function() {
        const response = await fetch('$blobUrl');
        const blob = await response.blob();
        const reader = new FileReader();
        reader.onloadend = function() {
          const base64data = reader.result.split(',')[1];
          BlobDataChannel.postMessage(base64data);
        };
        reader.readAsDataURL(blob);
      })();
    ''';
    _controller.runJavascript(script);
  }
}
