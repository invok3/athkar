import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/pages/components/frequency_controller.dart';
import 'package:athkar_app/pages/components/titled_box.dart';
import 'package:athkar_app/pages/components/titled_box_body.dart';
import 'package:athkar_app/providers/settings_provider.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
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
          pinned: true,
          stretch: true,
          shape: customRoundedRectangleBorder,
          backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
          leading: IconButton(
            onPressed: () {},
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
                  ontap: () {},
                  filled: true,
                  icon: Icon(Icons.ac_unit),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width / 10),
                child: CustomOutlinedButton(
                  text: "أذكار المساء",
                  ontap: () {
                    debugPrint("asd");
                  },
                  filled: true,
                  icon: Icon(Icons.ac_unit),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width / 10),
                child: CustomOutlinedButton(
                  text: "أذكار متنوعة",
                  ontap: () {},
                  filled: true,
                  icon: Icon(Icons.ac_unit),
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
                                .accentColor))
                  ],
                ),
                width: _size.width * .8,
                title: "أسماء الله الحسنى",
              ),
              SizedBox(height: 24),
              SizedBox(height: 500),
            ],
          ),
        ),
      ],
    );
  }
}
