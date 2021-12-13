import 'package:flutter/material.dart';

const kAppTitle = Text('Notification Blocker');

const kCardColor = Color(0xFFE8E8E8);
const kLabelTextColor = Color(0xFF173C6D);
const kForwardIcon = IconData(0xe09c, fontFamily: 'MaterialIcons', matchTextDirection: true);
const kReusableCardMargin = EdgeInsets.all(5.0);

const kSwitchLabelTextStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.w800,
  color: Color(0xFF575757),
);

const kLabelTextStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.w800,
  color: kLabelTextColor,
);

const kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
  border: InputBorder.none,
);

const kAppIconWidth = 50.0;
const kAppIconHeight = 35.0;

const kAppIconSmallWidth = 50.0;
const kAppIconSmallHeight = 30.0;

const kMaxDisplayBlockedApps = 6;
const kDisplayAppNameMaxCharacters = 15;