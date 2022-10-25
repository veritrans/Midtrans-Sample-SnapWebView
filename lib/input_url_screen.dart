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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _url,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Put your SNAP link (optional)'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SnapWebViewScreen.routeName,
                    arguments: {
                      'url' : _url.text,
                    },
                  );
                },
                child: const Text('Go Next Page'))
          ],
        ),
      ),
    );
  }
}
