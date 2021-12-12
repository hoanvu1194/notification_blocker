import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:notification_blocker/constants.dart';

class AppItem extends StatelessWidget {
  final Uint8List iconData;
  final String appName;
  final Function(bool?) checkboxCallback;
  final bool isChecked;

  AppItem({
    required this.iconData,
    required this.appName,
    required this.isChecked,
    required this.checkboxCallback,
  });

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
            Checkbox(value: isChecked, onChanged: checkboxCallback),
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
