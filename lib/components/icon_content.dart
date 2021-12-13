import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String label;

  IconContent({required this.iconData, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              iconData,
              size: 22.0,
              color: kLabelTextColor,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              label,
              style: kLabelTextStyle,
            ),
          ],
        ),
        Icon(
          kForwardIcon,
          size: 18.0,
          color: kLabelTextColor,
        ),
      ],
    );
  }
}