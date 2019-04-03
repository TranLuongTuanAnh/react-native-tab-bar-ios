/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View} from 'react-native';

import {TabBarIOS} from 'react-native-TabBarIOS';
console.log("TabBarIOS", TabBarIOS);


export default class StarterTabBarIOS extends React.Component {

  constructor(props) {
    super(props);
    this.state = {selectedTab: 'tabFavorites'};
  }

  setTab(tabId) {
    this.setState({selectedTab: tabId});
  }

  render() {
    return (
      <TabBarIOS>
        <TabBarIOS.Item
          systemIcon="favorites"
          selected={this.state.selectedTab === 'tabFavorites'}
          onPress={() => this.setTab('tabFavorites')}>
          <View style={styles.tabContent}>
            <Text style={styles.tabText}>Favorites</Text>
          </View>
        </TabBarIOS.Item>

        <TabBarIOS.Item
          systemIcon="downloads"
          selected={this.state.selectedTab === 'tabDownloads'}
          onPress={() => this.setTab('tabDownloads')}>
          <View style={styles.tabContent}>
            <Text style={styles.tabText}>Downloads</Text>
          </View>
        </TabBarIOS.Item>

        <TabBarIOS.Item
          systemIcon="more"
          selected={this.state.selectedTab === 'tabMore'}
          onPress={() => this.setTab('tabMore')}>
          <View style={styles.tabContent}>
            <Text style={styles.tabText}>More</Text>
          </View>
        </TabBarIOS.Item>
      </TabBarIOS>
    );
  }

}

/**
 * Favorites Tab
 */
class TabFavorites extends React.Component {

  render() {
    return (
      <View style={styles.tabContent}>
        <Text style={styles.tabText}>Favorites</Text>
      </View>
    );
  }

}

/**
 * Downloads Tab
 */
class TabDownloads extends React.Component {

  render() {
    return (
      <View style={styles.tabContent}>
        <Text style={styles.tabText}>Downloads</Text>
      </View>
    );
  }

}

/**
 * More Tab
 */
class TabMore extends React.Component {

  render() {
    return (
      <View style={styles.tabContent}>
        <Text style={styles.tabText}>More</Text>
      </View>
    );
  }

}

var styles = StyleSheet.create({
  tabContent: {
    flex: 1,
    alignItems: 'center'
  },
  tabText: {
    margin: 50,
    fontSize: 40
  }
});
