import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:device_apps/device_apps.dart';
import 'package:notification_blocker/models/app.dart';

class AppsData extends ChangeNotifier {
  List<App> _apps = [];

  List<App> get blockedApps {
    return _apps;
  }

  int get appsCount {
    return _apps.length;
  }

  AppsData() {
    initAppsList();
  }

  void initAppsList() async {
    List apps = await DeviceApps.getInstalledApplications(
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
        includeSystemApps: true);

    apps.sort((a, b) => sortAppNames(a, b));

    for (int i = 0; i < apps.length; i++) {
      App app =
          App(iconData: apps[i].icon, name: apps[i].appName, isBlocked: false);
      _apps.add(app);
    }
  }

  void addApp(String newAppName, Uint8List iconData) {
    final app = App(name: newAppName, iconData: iconData);
    if (_apps.contains(app)) {
      return;
    }
    _apps.add(app);
    notifyListeners();
  }

  void removeApp(String appName) {
    for (App app in _apps) {
      if (app.name == appName) {
        _apps.remove(app);
      }
    }
    notifyListeners();
  }

  void updateApp(App app) {
    app.toggleBlocked();
    notifyListeners();
  }
}

int sortAppNames(Application a, Application b) {
  String propertyA = a.appName.toLowerCase();
  String propertyB = b.appName.toLowerCase();
  return propertyA.compareTo(propertyB);
}