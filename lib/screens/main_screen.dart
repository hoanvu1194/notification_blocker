import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/components/icon_content.dart';
import 'package:notification_blocker/components/reusable_card.dart';
import 'package:notification_blocker/screens/settings_screen.dart';
import 'package:notification_blocker/screens/blocked_apps_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kAppTitle,
        actions: [
          IconButton(
            icon: const  Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              //Go to settings screen.
              Navigator.pushNamed(context, SettingsScreen.id);
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Block Notifications',
                style: kSwitchLabelTextStyle,
              ),
              Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  //Go to blocked apps screen.
                  Navigator.pushNamed(context, BlockedAppsScreen.id);
                });
              },
              colour: kCardColor,
              cardChild: Container(
                margin: kReusableCardMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.ban,
                      label: 'Blocked Apps',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  // on press Schedule time
                });
              },
              colour: kCardColor,
              cardChild: Container(
                margin: kReusableCardMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.clock,
                      label: 'Schedule Time',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  // on press missed notifications
                });
              },
              colour: kCardColor,
              cardChild: Container(
                margin: kReusableCardMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.commentSlash,
                      label: 'Missed Notifications',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

