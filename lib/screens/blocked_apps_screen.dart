import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:device_apps/device_apps.dart';

import 'package:notification_blocker/constants.dart';

import 'package:notification_blocker/components/blocked_app_item.dart';

class BlockedAppsScreen extends StatefulWidget {
  static const String id = 'blocked_apps_screen';
  final List apps;

  List<bool?> _checkboxValues = List.filled(1, false);

  BlockedAppsScreen({Key? key, required this.apps}) : super(key: key);

  @override
  State<BlockedAppsScreen> createState() => _BlockedAppsScreenState();
}

class _BlockedAppsScreenState extends State<BlockedAppsScreen> {
  @override
  void initState() {
    widget._checkboxValues = List.filled(widget.apps.length, false);
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
            Column(
              children: [
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
              ],
            ),

            // list apps
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < widget.apps.length; i++)
                      BlockedAppItem(
                        iconData: widget.apps[i] is ApplicationWithIcon
                          ? widget.apps[i].icon
                          : null,
                        appName: widget.apps[i].appName,
                        checkboxValue: widget._checkboxValues[i],
                        onCheckboxChanged: (bool? value) {
                          setState(() {
                            widget._checkboxValues[i] = value;
                          });
                        },
                      ),
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
