import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notification_blocker/constants.dart';

class ScheduleTimeScreen extends StatefulWidget {
  static const String id = 'schedule_time_screen';

  const ScheduleTimeScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleTimeScreen> createState() => _ScheduleTimeScreenState();
}

class _ScheduleTimeScreenState extends State<ScheduleTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Time'),
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