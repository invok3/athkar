import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitledBox extends StatelessWidget {
  final String? title;
  final Widget child;
  final double width;
  const TitledBox({
    Key? key,
    this.title,
    required this.child,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: Provider.of<ThemeProvider>(context).kPrimary),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50), topLeft: Radius.circular(50)),
      ),
      child: Stack(
        children: [
          title == null
              ? Container()
              : Positioned(
                  top: -1,
                  left: -1,
                  right: -1,
                  child: BoxTitle(
                    title: title!,
                    width: width,
                  ),
                ),
          child
        ],
      ),
    );
  }
}

class BoxTitle extends StatelessWidget {
  final String title;
  final double width;
  const BoxTitle({Key? key, required this.title, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: Provider.of<ThemeProvider>(context).kPrimary),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50), topLeft: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Provider.of<ThemeProvider>(context).kPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
