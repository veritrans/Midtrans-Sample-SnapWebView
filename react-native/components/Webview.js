import React from 'react';
import { WebView } from 'react-native-webview';
import { View, ActivityIndicator, StyleSheet } from 'react-native';

const DEFAULT_URI = 'https://sample-demo-dot-midtrans-support-tools.et.r.appspot.com/snap-redirect/';

const WebviewComponent = ({ uri }) => {
  const [isLoading, setLoading] = React.useState(true);

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
