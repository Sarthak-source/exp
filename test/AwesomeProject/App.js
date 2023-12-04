import React, { useState } from 'react';
import {
  StyleSheet,
  View,
  Text,
  SafeAreaView,
  SectionList,
  StatusBar,
  TextInput,
  ScrollView,
} from 'react-native';
import { Appbar } from 'react-native-paper';
import Icon from 'react-native-vector-icons/Ionicons';

import { SafeAreaProvider } from 'react-native-safe-area-context';

export default function App() {
  const [value, onChangeText] = React.useState('Useless Multiline Placeholder');
  const _handleMore = () => console.log('Shown more');

  const actionsList =
    [
      <Appbar.Action key={"dots-vertical"} icon="dots-vertical" onPress={_handleMore} />
    ]

  return (
    <SafeAreaProvider>
      <AppBarHeader title="Conversation" titlePosition="center" actions={actionsList} showSearch={true}/>
      <ScrollView>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
        <Text>Helo</Text>
      </ScrollView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  header: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
},);




class AppBarHeader extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: props.title,
      titlePosition: props.titlePosition,
      actions: props.actions,
      showSearch: props.showSearch
    };
  }

  render() {
    const _goBack = () => console.log('Went back');
    const _handleSearch = () => console.log('Searching');


    return (
      <Appbar.Header>
        <Appbar.Action icon="chevron-left" onPress={_goBack}/>
        <Appbar.Content
          title={this.state.title}
          style={{
            flex: 1,
            alignItems: this.state.titlePosition
          }}
        />
        {this.state.showSearch ? <Appbar.Action key={"magnify"} icon="magnify" onPress={_handleSearch} /> : null}
        {this.state.actions}
      </Appbar.Header>
    );
  }
}




