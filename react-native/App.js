import React from 'react';
import { gestureHandlerRootHOC } from 'react-native-gesture-handler';
import { StyleSheet, View, TextInput, Image, Text, TouchableOpacity } from 'react-native';
import BottomSheet from '@gorhom/bottom-sheet';
import Webview from './components/Webview';

function App() {
  const [isOpen, setOpen] = React.useState(false);
  const [uri, setUri] = React.useState('');

  return (
    <View style={styles.container}>
      <Image source={require('./images/midtrans-logo.png')} style={styles.image} />
      <Text style={styles.title}>SNAP on React Native Webview</Text>
      <TextInput
        style={styles.input}
        onChangeText={setUri}
        value={null}
        placeholder="Put your SNAP link (optional)"
        keyboardType="default"
      />
      <TouchableOpacity
        style={styles.button}
        onPress={() => setOpen(!isOpen)}
      >
        <Text style={styles.button__text}>Open SNAP</Text>
      </TouchableOpacity>
      {
        isOpen && (
          <BottomSheet
            snapPoints={['95%']}
            enablePanDownToClose={true}
            onClose={() => setOpen(false)}
          >
            <Webview uri={uri} />
          </BottomSheet>
        )
      }
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 100,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'flex-start',
  },
  image: {
    height: 50,
    width: 200,
    resizeMode: 'contain',
  },
  title: {
    fontSize: 18,
    margin: 12,
  },
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
    width: 300,
    borderColor: '#EAEAEA',
  },
  button: {
    width: 150,
    padding: 10,
    borderRadius: 8,
    alignItems: 'center',
    backgroundColor: '#355f86',
  },
  button__text: {
    color: '#FFFFFF'
  },
});

export default gestureHandlerRootHOC(App);