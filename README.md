# Midtrans Sample SNAP in Flutter WebView

## Introduction
If your mobile app is using Flutter WebView to display Snap, this is a sample project that you can use to try open Snap using Flutter WebView.

## Prerequisite
1. [Flutter](https://docs.flutter.dev/get-started/install)

## Technical point
You need to make sure the app follows the points given below.
- Enable JavaScript capability for the WebView.
```dart
WebView(
...
...
    javascriptMode: JavascriptMode.unrestricted,
)
```
- Allow WebView to open bank web domain.
```dart
WebView(
...
...
    navigationDelegate: (navigation) {
        final host = Uri.parse(navigation.url).toString();
        if (host.contains('gojek://') ||
            host.contains('shopeeid://') ||
            host.contains('//wsa.wallet.airpay.co.id/') ||
            // This is handle for sandbox Simulator
            host.contains('/gopay/partner/') ||
            host.contains('/shopeepay/')) {
        _launchInExternalBrowser(Uri.parse(navigation.url));
        return NavigationDecision.prevent;
        } else {
        return NavigationDecision.navigate;
        }
    }
)
```

## Useful Resources
- [Midtrans - Testing Payment on Sandbox](https://docs.midtrans.com/en/technical-reference/sandbox-test)

