import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notification_blocker/components/icon_content.dart';
import 'package:notification_blocker/constants.dart';
import 'package:notification_blocker/components/reusable_card.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  bool _switchValue = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const  Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Block Notifications',
                style: kSwitchLabelTextStyle,
              ),
              Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  // on press blocked apps
                });
              },
              colour: kCardColor,
              cardChild: Container(
                margin: kReusableCardMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.ban,
                      label: 'Blocked Apps',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  // on press Schedule time
                });
              },
              colour: kCardColor,
              cardChild: Container(
                margin: kReusableCardMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.clock,
                      label: 'Schedule Time',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {
                setState(() {
                  // on press missed notifications
                });
              },
              colour: kCardColor,
              cardChild: Container(
                margin: kReusableCardMargin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconContent(
                      iconData: FontAwesomeIcons.commentSlash,
                      label: 'Missed Notifications',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

