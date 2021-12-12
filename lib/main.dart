import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:global_configuration/global_configuration.dart';
import 'package:notification_blocker/config/app_settings.config.dart';
import 'package:notification_blocker/models/apps_data.dart';

import 'package:notification_blocker/screens/main_screen.dart';
import 'package:notification_blocker/screens/settings_screen.dart';
import 'package:notification_blocker/screens/schedule_time_screen.dart';
import 'package:notification_blocker/screens/missed_notifications_screen.dart';
import 'package:notification_blocker/models/apps_data.dart';

void main() {
  GlobalConfiguration().loadFromMap(appSettings);
  runApp(NotificationBlocker());
}

class NotificationBlocker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppsData(),
      child: MaterialApp(
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => const MainScreen(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          ScheduleTimeScreen.id: (context) => const ScheduleTimeScreen(),
          MissedNotificationsScreen.id: (context) =>
              const MissedNotificationsScreen(),
        },
      ),
    );
  }
}
