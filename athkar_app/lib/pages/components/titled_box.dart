import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitledBox extends StatelessWidget {
  final String? title;
  final Widget child;
  final double width;
  final bool inverted;
  final bool titleContained;
  const TitledBox({
    Key? key,
    this.title,
    this.inverted = false,
    this.titleContained = false,
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
          inverted ? child : SizedBox(),
          title == null
              ? SizedBox()
              : Positioned(
                  top: inverted ? null : -1,
                  left: -1,
                  right: -1,
                  bottom: inverted ? -1 : null,
                  child: BoxTitle(
                    contained: titleContained,
                    title: title!,
                    width: width,
                  ),
                ),
          inverted ? SizedBox() : child,
        ],
      ),
    );
  }
}

class BoxTitle extends StatelessWidget {
  final String title;
  final double width;
  final bool contained;
  const BoxTitle(
      {Key? key,
      required this.title,
      required this.width,
      this.contained = false})
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
            child: Container(
              padding: contained ? EdgeInsets.all(8) : null,
              decoration: contained
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            color:
                                Provider.of<ThemeProvider>(context).accentColor)
                      ],
                      color: Colors.white,
                    )
                  : null,
              child: Text(
                title,
                style: TextStyle(
                  color: Provider.of<ThemeProvider>(context).kPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
