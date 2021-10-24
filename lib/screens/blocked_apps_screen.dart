import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notification_blocker/constants.dart';

class BlockedAppsScreen extends StatefulWidget {
  static const String id = 'blocked_apps_screen';

  const BlockedAppsScreen({Key? key}) : super(key: key);

  @override
  State<BlockedAppsScreen> createState() => _BlockedAppsScreenState();
}

class _BlockedAppsScreenState extends State<BlockedAppsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocked Apps'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.search,
                  size: 20.0,
                  color: kLabelTextColor,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {

                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Search'),
                  ),
                ),
              ],
            ),
            Divider(
              color: kLabelTextColor,
              height: 1,
              thickness: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}