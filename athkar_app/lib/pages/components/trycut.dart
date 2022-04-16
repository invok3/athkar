import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class Trycut extends StatelessWidget {
  const Trycut({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: _width,
          width: _width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Provider.of<ThemeProvider>(context)
                        .accentColor
                        .withOpacity(.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 0))
              ],
              border: Border.all(
                width: 10,
                color: Provider.of<ThemeProvider>(context).accentColor,
              ),
              borderRadius: BorderRadius.circular(_width * 3)),
          child: Center(
              child: Text(
            "أستغفر الله",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        Transform.rotate(
          angle: -math.pi / 2,
          child: Row(
            children: [
              Container(color: Colors.white, height: 4, width: 12),
              SizedBox(
                height: 4,
                width: _width / 3 - 12,
              ),
            ],
          ),
        ),
        Transform.rotate(
          angle: math.pi / 6,
          child: Row(
            children: [
              Container(color: Colors.white, height: 4, width: 12),
              SizedBox(
                height: 4,
                width: _width / 3 - 12,
              ),
            ],
          ),
        ),
        Transform.rotate(
          angle: math.pi / 1.2,
          child: Row(
            children: [
              Container(color: Colors.white, height: 4, width: 12),
              SizedBox(
                height: 4,
                width: _width / 3 - 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
