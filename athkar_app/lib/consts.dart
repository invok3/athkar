import 'package:flutter/material.dart';

RoundedRectangleBorder customRoundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: appBarBorderRadiusGeometry(),
);

BorderRadius appBarBorderRadiusGeometry() {
  return BorderRadius.only(
    bottomLeft: Radius.circular(.33 * appBarHeight()),
    bottomRight: Radius.circular(.33 * appBarHeight()),
  );
}

double appBarHeight() => AppBar().preferredSize.height;

enum TimedAthkar { day, night }

extension AthcarInfo on TimedAthkar {
  String get name {
    return ["أذكار الصباح", "أذكار المساء"][index];
  }

  List<Map<String, String>> get list {
    return [
      [
        {"text": "a", "repeat": "10"},
        {"text": "a", "repeat": "10"},
      ],
      [
        {"text": "a", "repeat": "10"},
        {"text": "a", "repeat": "10"},
      ],
    ][index];
  }
}
