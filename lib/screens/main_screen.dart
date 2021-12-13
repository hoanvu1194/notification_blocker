import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/components/icon_content.dart';
import 'package:notification_blocker/components/reusable_card.dart';
import 'package:notification_blocker/screens/settings_screen.dart';
import 'package:notification_blocker/screens/blocked_apps_screen.dart';
import 'package:notification_blocker/screens/schedule_time_screen.dart';
import 'package:notification_blocker/screens/missed_notifications_screen.dart';

import 'package:notification_blocker/components/blocked_app_item.dart';
import 'package:notification_blocker/models/apps_data.dart';

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
    int blockedAppsCount = Provider.of<AppsData>(context).blockedAppsCount;

    return Scaffold(
      appBar: AppBar(
        title: kAppTitle,
        actions: [
          IconButton(
            icon: const Icon(
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
                //Go to blocked apps screen.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlockedAppsScreen()));
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
                    Row(
                      children: [
                        BlockedAppItem(0),
                        BlockedAppItem(1),
                      ],
                    ),
                    Row(
                      children: [
                        BlockedAppItem(2),
                        BlockedAppItem(3),
                      ],
                    ),
                    Row(
                      children: [
                        BlockedAppItem(4),
                        BlockedAppItem(5),
                      ],
                    ),
                    if (blockedAppsCount > kMaxDisplayBlockedApps)
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                            '${blockedAppsCount - kMaxDisplayBlockedApps} more app(s) blocked'),
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
                  //Go to schedule time screen.
                  Navigator.pushNamed(context, ScheduleTimeScreen.id);
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
                  //Go to missed notifications screen.
                  Navigator.pushNamed(context, MissedNotificationsScreen.id);
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
