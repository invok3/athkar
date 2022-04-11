import 'package:flutter/material.dart';

RoundedRectangleBorder customRoundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: appBarBorderRadiusGeometry(),
);

BorderRadius appBarBorderRadiusGeometry() {
  return BorderRadius.only(
    bottomLeft: Radius.circular(appBarRadius()),
    bottomRight: Radius.circular(appBarRadius()),
  );
}

double appBarRadius() => .33 * AppBar().preferredSize.height;
