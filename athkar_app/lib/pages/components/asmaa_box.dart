import 'dart:math';

import 'package:athkar_app/pages/asmaa_page.dart';
import 'package:athkar_app/pages/components/titled_box.dart';
import 'package:athkar_app/pages/components/titled_box_body.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AsmaaBox extends StatefulWidget {
  final Size size;

  const AsmaaBox({Key? key, required this.size}) : super(key: key);

  @override
  State<AsmaaBox> createState() => _AsmaaBoxState();
}

class _AsmaaBoxState extends State<AsmaaBox> {
  int? index;
  @override
  Widget build(BuildContext context) {
    index = index ?? Random().nextInt(98);
    return TitledBox(
      child: TitledBoxBody(
        size: widget.size,
        children: [
          Text(index.toString(),
              style: TextStyle(
                  //fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Provider.of<ThemeProvider>(context).accentColor)),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () => setState(() {
                  index = Random().nextInt(98);
                }),
                icon: SvgPicture.asset("assets/icons/refresh.svg"),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AsmaaPage(ind: index!)))
                    .then((value) => setState(() {
                          index = value;
                        })),
                icon: SvgPicture.asset("assets/icons/goto.svg"),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
      width: widget.size.width * .8,
      title: "أسماء الله الحسنى",
    );
  }
}
