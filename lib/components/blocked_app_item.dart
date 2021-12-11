import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

import 'package:notification_blocker/constants.dart';

class BlockedAppItem extends StatelessWidget {
  BlockedAppItem({
    required this.iconData,
    required this.appName,
    required this.checkboxValue,
    required this.onCheckboxChanged,
  });

  final Uint8List iconData;
  final String appName;
  final ValueChanged<bool?>? onCheckboxChanged;

  bool? checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.memory(
              iconData,
              width: kAppIconWidth,
              height: kAppIconHeight,
            ),
            Expanded(
              child: Text(
                appName,
                textAlign: TextAlign.left,
              ),
            ),
            Checkbox(value: checkboxValue, onChanged: onCheckboxChanged),
          ],
        ),
        const Divider(
          color: kLabelTextColor,
          height: 0.5,
          thickness: 1.0,
        ),
      ],
    );
  }
}

