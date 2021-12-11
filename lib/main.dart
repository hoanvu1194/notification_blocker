import 'package:flutter/material.dart';
import 'package:notification_blocker/screens/main_screen.dart';
import 'package:notification_blocker/screens/settings_screen.dart';
import 'package:notification_blocker/screens/blocked_apps_screen.dart';
import 'package:notification_blocker/screens/schedule_time_screen.dart';
import 'package:notification_blocker/screens/missed_notifications_screen.dart';

void main() => runApp(NotificationBlocker());

class NotificationBlocker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => const MainScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
        // BlockedAppsScreen.id: (context) => const BlockedAppsScreen(),
        ScheduleTimeScreen.id: (context) => const ScheduleTimeScreen(),
        MissedNotificationsScreen.id: (context) => const MissedNotificationsScreen(),
      },
    );
  }
}
