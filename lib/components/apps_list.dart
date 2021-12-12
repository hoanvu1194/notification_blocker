import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notification_blocker/components/app_item.dart';
import 'package:notification_blocker/models/apps_data.dart';

class AppsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppsData>(
      builder: (context, appsData, child) {
        return Scrollbar(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            itemCount: appsData.blockedApps.length,
            itemBuilder: (context, index) {
              final app = appsData.blockedApps[index];
              return AppItem(
                appName: app.name,
                iconData: app.iconData,
                isChecked: app.isBlocked,
                checkboxCallback: (checkboxState) {
                  appsData.updateApp(app);
                },
              );
            },
          ),
        );
      },
    );
  }
}
