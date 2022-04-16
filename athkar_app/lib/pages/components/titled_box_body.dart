import 'package:flutter/material.dart';

class TitledBoxBody extends StatelessWidget {
  const TitledBoxBody({
    Key? key,
    required this.size,
    required this.children,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .8,
      padding: EdgeInsets.all(16),
      child: Column(
          children: <Widget>[
                SizedBox(
                  height: 48,
                ),
              ] +
              children +
              [
                // SizedBox(height: 24),
              ]),
    );
  }
}
