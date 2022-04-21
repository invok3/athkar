import 'dart:math';

import 'package:athkar_app/pages/components/titled_box.dart';
import 'package:athkar_app/pages/components/titled_box_body.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NiamBox extends StatefulWidget {
  final Size size;
  const NiamBox({Key? key, required this.size}) : super(key: key);

  @override
  State<NiamBox> createState() => _NiamBoxState();
}

class _NiamBoxState extends State<NiamBox> {
  int index = Random().nextInt(20);

  @override
  Widget build(BuildContext context) {
    return TitledBox(
      child: TitledBoxBody(
        size: widget.size,
        children: [
          Text(
            "أشكرك ربي على نعمة",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12
                // color: Provider.of<ThemeProvider>(context).accentColor,
                ),
          ),
          SizedBox(height: 12),
          Text(index.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Provider.of<ThemeProvider>(context).accentColor)),
          SizedBox(height: 12),
          Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () => setState(() {
                  index = Random().nextInt(20);
                }),
                icon: SvgPicture.asset(
                  "assets/icons/refresh.svg",
                  color: Provider.of<ThemeProvider>(context).kPrimary,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
      width: widget.size.width * .8,
      title: "الحمد و الشكر",
    );
  }
}
