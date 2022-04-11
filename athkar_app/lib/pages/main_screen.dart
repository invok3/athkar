import 'package:athkar_app/consts.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                  StretchMode.blurBackground
                ],
                expandedTitleScale: 1.2,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 28),
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
                              padding: const EdgeInsets.only(bottom: 32),
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
              child: Container(
                height: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
