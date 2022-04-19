import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/pages/components/trycut.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({Key? key}) : super(key: key);

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
              icon: SvgPicture.asset(
                "assets/icons/moon.svg",
                color: Provider.of<ThemeProvider>(context).kPrimary,
              ),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/toggle.svg",
                color: Provider.of<ThemeProvider>(context).kPrimary,
              ),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/speaker.svg",
                color: Provider.of<ThemeProvider>(context).kPrimary,
              ),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/vibration.svg",
                color: Provider.of<ThemeProvider>(context).kPrimary,
              ),
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
        child: Padding(
          padding: EdgeInsets.all(_width * .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width / 6),
                child: CustomOutlinedButton(
                  text: "إبدأ",
                  ontap: () {},
                  boldness: FontWeight.bold,
                ),
              ),
              SizedBox(
                //color: Colors.red,
                width: _width * .7,
                height: _width * .7,
                child: Trycut(
                    child: Text(
                      "أستغفر الله",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    width: _width * .7,
                    color: Provider.of<ThemeProvider>(context).elevationColor,
                    thickness: 2.5),
              ),
              Text("مجموع التسبيحات",
                  style: Theme.of(context).textTheme.headline6),
              Text("0", style: Theme.of(context).textTheme.headline6),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _width / 10),
                child: CustomOutlinedButton(
                  text: "الحاسبة",
                  ontap: () {},
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
