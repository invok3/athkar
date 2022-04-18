import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/pages/components/frequency_controller.dart';
import 'package:athkar_app/pages/components/titled_box.dart';
import 'package:athkar_app/pages/components/titled_box_body.dart';
import 'package:athkar_app/pages/components/trycut.dart';
import 'package:athkar_app/pages/general_athkar_page.dart';
import 'package:athkar_app/pages/settings_page.dart';
import 'package:athkar_app/pages/timed_athkar_page.dart';
import 'package:athkar_app/providers/settings_provider.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainTab extends StatelessWidget {
  const MainTab({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          pinned: true,
          stretch: true,
          shape: customRoundedRectangleBorder,
          backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
          leading: IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SettingsPage())),
            icon: Icon(Icons.settings_outlined),
          ),
          expandedHeight: (_size.width / 2) + 8,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.fadeTitle,
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            expandedTitleScale: 1.2,
            title: Padding(
              padding: EdgeInsets.only(bottom: appBarHeight() * .7),
              child: Text(
                "6 رمضان 1443",
                style: TextStyle(
                    color: Provider.of<ThemeProvider>(context).kPrimary),
              ),
            ),
            centerTitle: true,
            background: Container(
              color: Theme.of(context).canvasColor,
              child: Column(
                children: [
                  Container(
                      height: _size.width / 2,
                      width: _size.width,
                      decoration: BoxDecoration(
                        color: Provider.of<ThemeProvider>(context)
                            .appBarColor
                            .withOpacity(.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(_size.width),
                          bottomRight: Radius.circular(_size.width),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: appBarHeight()),
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: _size.width * .22,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )),
                  SizedBox(height: 8)
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              TitledBox(
                width: _size.width * .8,
                title: "معدل ظهور الأذكار على الشاشه",
                child: ChangeNotifierProvider<SettingsProvider>(
                  create: (_) => SettingsProvider(),
                  child: FrequencyController(
                    width: _size.width * .8,
                    paddingTop: 48,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width / 10),
                child: CustomOutlinedButton(
                  text: "أذكار الصباح",
                  ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TimedAthkarPage(
                          timedAthkar: TimedAthkar.day,
                        ),
                      )),
                  filled: true,
                  icon: Image.asset("assets/images/day.png"),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width / 10),
                child: CustomOutlinedButton(
                  text: "أذكار المساء",
                  ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TimedAthkarPage(
                          timedAthkar: TimedAthkar.night,
                        ),
                      )),
                  filled: true,
                  icon: Image.asset("assets/images/night.png"),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width / 10),
                child: CustomOutlinedButton(
                  text: "أذكار متنوعة",
                  ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GeneralAthkarPage(),
                      )),
                  filled: true,
                  icon: Image.asset("assets/images/hands.png"),
                ),
              ),
              SizedBox(height: 24),
              TitledBox(
                child: TitledBoxBody(
                  size: _size,
                  children: [
                    Text("الودود",
                        style: TextStyle(
                            //fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Provider.of<ThemeProvider>(context)
                                .accentColor)),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/refresh.svg"),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/goto.svg"),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
                width: _size.width * .8,
                title: "أسماء الله الحسنى",
              ),
              SizedBox(height: 24),
              TitledBox(
                child: TitledBoxBody(
                  size: _size,
                  children: [
                    SizedBox(
                      //color: Colors.red,
                      width: _size.width / 3,
                      height: _size.width / 3,
                      child: Trycut(width: _size.width / 3),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/goto.svg"),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
                width: _size.width * .8,
                title: "التسبيح",
              ),
              SizedBox(height: 24),
              TitledBox(
                child: TitledBoxBody(
                  size: _size,
                  children: [
                    Text(
                      "أشكرك ربي على نعمة",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12
                          // color: Provider.of<ThemeProvider>(context).accentColor,
                          ),
                    ),
                    SizedBox(height: 12),
                    Text("البصر",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Provider.of<ThemeProvider>(context)
                                .accentColor)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/refresh.svg"),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
                width: _size.width * .8,
                title: "الحمد و الشكر",
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
