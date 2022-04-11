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
