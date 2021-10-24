import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/components/setting_item.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SettingItem(
            label: 'Enable Permission',
            onPress: () {

            },
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          SettingItem(
            label: 'Contact Us',
            onPress: () {

            },
          ),
          Divider(
            color: Colors.grey,
            height: 1,
          ),
          SettingItem(
            label: 'About',
            onPress: () {

            },
          ),
        ],
      ),
    );
  }
}

