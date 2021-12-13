import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/models/app.dart';
import 'package:notification_blocker/models/apps_data.dart';
import 'package:provider/provider.dart';

class BlockedAppItem extends StatelessWidget {
  int _index;

  BlockedAppItem(this._index);

  @override
  Widget build(BuildContext context) {
    List<App> blockedApps = Provider.of<AppsData>(context).blockedApps;
    int blockedAppsCount = blockedApps.length;

    if (blockedAppsCount == 0 || _index >= blockedAppsCount) {
      return const Text('');
    }

    App app = blockedApps[_index];
    String displayAppName = app.name;
    if (displayAppName.length > kDisplayAppNameMaxCharacters) {
      displayAppName =
          displayAppName.substring(0, kDisplayAppNameMaxCharacters - 3) + '...';
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.memory(
              app.iconData,
              width: kAppIconSmallWidth,
              height: kAppIconSmallHeight,
            ),
            Text(
              displayAppName,
            ),
          ],
        ),
      ),
    );
  }
}
