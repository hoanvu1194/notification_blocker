import 'package:flutter/material.dart';
import 'package:notification_blocker/constants.dart';

class SettingItem extends StatelessWidget {
  SettingItem({required this.label, required this.onPress});

  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
      )
    );
  }
}