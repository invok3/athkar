import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/components/titled_box.dart';
import 'package:athkar_app/pages/components/titled_box_body.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TimedAthkarPage extends StatefulWidget {
  final TimedAthkar timedAthkar;

  const TimedAthkarPage({Key? key, required this.timedAthkar})
      : super(key: key);

  @override
  State<TimedAthkarPage> createState() => _TimedAthkarPageState();
}

class _TimedAthkarPageState extends State<TimedAthkarPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: customRoundedRectangleBorder,
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => debugPrint("asd"), icon: Icon(Icons.more_vert)),
        title: Text(
          widget.timedAthkar.name,
          overflow: TextOverflow.visible,
        ),
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 32,
        actions: [
          //mod - + not
          SizedBox(width: 32),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.mode_night),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              visualDensity: VisualDensity.compact),
          SizedBox(width: 32),
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_forward),
              visualDensity: VisualDensity.compact)
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              vertical: _size.width / 10, horizontal: _size.width / 10),
          child: Column(
            children: [
              TitledBox(
                inverted: true,
                titleContained: true,
                child: TitledBoxBody(
                  size: _size,
                  children: [
                    Text(
                      "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Provider.of<ThemeProvider>(context).kPrimary),
                      textAlign: TextAlign.center,
                    )
                  ],
                  inverted: true,
                ),
                width: _size.width * .8,
                title: "99",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
