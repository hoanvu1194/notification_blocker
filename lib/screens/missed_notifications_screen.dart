import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notification_blocker/constants.dart';

class MissedNotificationsScreen extends StatefulWidget {
  static const String id = 'missed_notifications_screen';

  const MissedNotificationsScreen({Key? key}) : super(key: key);

  @override
  State<MissedNotificationsScreen> createState() => _MissedNotificationsScreenState();
}

class _MissedNotificationsScreenState extends State<MissedNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missed Notifications'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}