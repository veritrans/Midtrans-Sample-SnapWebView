import React, { useState } from 'react';
import { View, Alert, StyleSheet, ActivityIndicator } from 'react-native';
import { WebView } from 'react-native-webview';
import RNFS from 'react-native-fs';
import RNFetchBlob from 'rn-fetch-blob';

const DEFAULT_URI = 'https://sample-demo-dot-midtrans-support-tools.et.r.appspot.com/snap-redirect/';

const WebviewComponent = ({ uri }) => {
  const [isLoading, setLoading] = useState(true);

  const handleDownload = async (url) => {
    const downloadDest = `${RNFS.DocumentDirectoryPath}/${new Date().getTime()}.png`;

    RNFetchBlob.config({
      fileCache: true,
      path: downloadDest,
    })
      .fetch('GET', url)
      .then((res) => {
        Alert.alert('Download Complete', `File downloaded to: ${res.path()}`);
      })
      .catch((error) => {
        Alert.alert('Download Error', error.message);
      });
  };

  return (
    <View style={styles.wrapper}>
      <WebView
        source={{ uri: uri || DEFAULT_URI }}
        onLoad={() => setLoading(false)}
        javaScriptEnabled={true}
        javaScriptCanOpenWindowsAutomatically={true}
        domStorageEnabled={true}
        cacheEnabled={true}
        allowFileAccessFromFileURLs={true}
        allowFileAccess={true}
        cacheMode="LOAD_NO_CACHE"
        onShouldStartLoadWithRequest={(request) => {
          if (url.startsWith('blob:')) {
            handleDownload(request.url);
            return false;
          }
          return true;
        }}
      />
      {isLoading && (
        <View style={styles.loader}>
          <ActivityIndicator size='large' color='blue' />
        </View>
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  wrapper: {
    flex: 1,
  },
  loader: {
    position: 'absolute',
    top: '50%',
    right: 0,
    left: 0,
  },
});


export default WebviewComponent;
