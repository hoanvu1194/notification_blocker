import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:device_apps/device_apps.dart';
import 'package:notification_blocker/components/apps_list.dart';

import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/components/app_item.dart';
import 'package:notification_blocker/models/apps_data.dart';
import 'package:provider/provider.dart';

class BlockedAppsScreen extends StatefulWidget {
  static const String id = 'blocked_apps_screen';

  const BlockedAppsScreen({Key? key}) : super(key: key);

  @override
  State<BlockedAppsScreen> createState() => _BlockedAppsScreenState();
}

class _BlockedAppsScreenState extends State<BlockedAppsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocked Apps'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // search bar
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
                    onChanged: (value) {},
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Search'),
                  ),
                ),
              ],
            ),
            const Divider(
              color: kLabelTextColor,
              height: 1,
              thickness: 3.0,
            ),

            // list apps
            Expanded(
              child: AppsList(),
            ),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: AppsList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
