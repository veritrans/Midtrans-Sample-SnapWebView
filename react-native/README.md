# Midtrans Sample SNAP in React Native WebView

## Introduction
If your mobile app is using React Native WebView to display Snap, this is a sample project that you can use to try open Snap using Flutter WebView.

## Prerequisite
1. [React Native](https://reactnative.dev/docs/environment-setup)
2. [react-native-webview](https://github.com/react-native-webview/react-native-webview/blob/master/docs/Getting-Started.md)

## Technical point
You need to make sure the app follows the points given below.
- Enable JavaScript capability in react-native-webview.
```
<WebView
  ...
  ...
  javaScriptEnabled={true}
  javaScriptCanOpenWindowsAutomatically={true}
  domStorageEnabled={true}
  cacheEnabled={true}
  allowFileAccessFromFileURLs={true}
  allowFileAccess={true}
  cacheMode="LOAD_NO_CACHE"
>
```

## Useful Resources
- [Midtrans - Testing Payment on Sandbox](https://docs.midtrans.com/en/technical-reference/sandbox-test)

