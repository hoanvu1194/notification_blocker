import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:notification_blocker/constants.dart';

class BlockedAppItem extends StatelessWidget {
  BlockedAppItem({
    required this.iconData,
    required this.appName,
  });

  final Uint8List iconData;
  final String appName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.memory(
          iconData,
          width: kAppIconSmallWidth,
          height: kAppIconSmallHeight,
        ),
        Text(
          appName,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

