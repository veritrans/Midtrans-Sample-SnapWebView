import 'package:flutter/material.dart';
import 'package:snap_webview/snap_web_view_screen.dart';

class InputUrlScreen extends StatefulWidget {
  const InputUrlScreen({Key? key}) : super(key: key);

  @override
  InputUrlState createState() => InputUrlState();
}

class InputUrlState extends State<InputUrlScreen> {
  final TextEditingController _url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Image(
                  image: AssetImage('assets/midtrans-logo.png'),
                  width: 200,
                  height: 42),
              const SizedBox(height: 10),
              const Text('SNAP on WebView', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: _url,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF0A2852))),
                      labelStyle: TextStyle(color: Color(0xFF0A2852)),
                      labelText: 'Put your SNAP link (optional)'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    String url;
                    if (_url.text == "") {
                      url =
                          "https://sample-demo-dot-midtrans-support-tools.et.r.appspot.com/snap-redirect/";
                    } else {
                      url = _url.text;
                    }
                    Navigator.of(context).pushNamed(
                      SnapWebViewScreen.routeName,
                      arguments: {
                        'url': url,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0A2852)),
                  child: const Text('Go Next Page'))
            ],
          ),
        ),
      ),
    );
  }
}
