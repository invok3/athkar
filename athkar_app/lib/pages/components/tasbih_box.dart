import 'package:athkar_app/pages/components/titled_box.dart';
import 'package:athkar_app/pages/components/titled_box_body.dart';
import 'package:athkar_app/pages/components/trycut.dart';
import 'package:athkar_app/pages/tasbih_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TasbihBox extends StatefulWidget {
  final Size size;
  const TasbihBox({Key? key, required this.size}) : super(key: key);

  @override
  State<TasbihBox> createState() => _TasbihBoxState();
}

class _TasbihBoxState extends State<TasbihBox> {
  @override
  Widget build(BuildContext context) {
    return TitledBox(
      child: TitledBoxBody(
        size: widget.size,
        children: [
          SizedBox(
            //color: Colors.red,
            width: widget.size.width / 3,
            height: widget.size.width / 3,
            child: Trycut(width: widget.size.width / 3),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TasbihPage())),
                icon: SvgPicture.asset("assets/icons/goto.svg"),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
      width: widget.size.width * .8,
      title: "التسبيح",
    );
  }
}
