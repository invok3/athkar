import 'package:athkar_app/consts.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({Key? key}) : super(key: key);

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: customRoundedRectangleBorder,
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
        automaticallyImplyLeading: false,
        leading: SizedBox(width: 16),
        title: Text("تسبيح"
            // overflow: TextOverflow.visible,
            ),
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 32,
        actions: [
          //mod - + not
          //SizedBox(width: 32),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.mode_night),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.refresh),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.speaker),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.vibration),
              visualDensity: VisualDensity.compact),
          SizedBox(width: 32),
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_forward),
              visualDensity: VisualDensity.compact)
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
