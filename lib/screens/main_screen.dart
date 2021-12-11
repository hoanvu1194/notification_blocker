import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:device_apps/device_apps.dart';

import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/components/icon_content.dart';
import 'package:notification_blocker/components/reusable_card.dart';
import 'package:notification_blocker/screens/settings_screen.dart';
import 'package:notification_blocker/screens/blocked_apps_screen.dart';
import 'package:notification_blocker/screens/schedule_time_screen.dart';
import 'package:notification_blocker/screens/missed_notifications_screen.dart';

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
              onPress: () async {
                List apps = await DeviceApps.getInstalledApplications(
                  onlyAppsWithLaunchIntent: true,
                  includeAppIcons: true,
                  includeSystemApps: true
                );
                apps.sort((a, b) => sortAppNames(a, b));
                setState(() {
                  //Go to blocked apps screen.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlockedAppsScreen(apps: apps)
                    )
                  );
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

int sortAppNames(Application a, Application b) {
  String propertyA = a.appName.toLowerCase();
  String propertyB = b.appName.toLowerCase();
  return propertyA.compareTo(propertyB);
}
