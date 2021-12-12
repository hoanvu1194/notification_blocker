import 'dart:typed_data';

class App {
  final String name;
  final Uint8List iconData;
  bool isBlocked;

  App({this.name = '', required this.iconData, this.isBlocked = false});

  void toggleBlocked() {
    isBlocked = !isBlocked;
  }
}