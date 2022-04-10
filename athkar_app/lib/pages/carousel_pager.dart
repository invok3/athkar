import 'dart:ui';

import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CarouselPager extends StatefulWidget {
  const CarouselPager({Key? key}) : super(key: key);

  @override
  State<CarouselPager> createState() => _CarouselPagerState();
}

class _CarouselPagerState extends State<CarouselPager> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .77,
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Provider.of<ThemeProvider>(context)
                                  .accentColor
                                  .withOpacity(.0),
                              Provider.of<ThemeProvider>(context)
                                  .accentColor
                                  .withOpacity(.25)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<ThemeProvider>(context)
                                .accentColor),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(75))),
                    height: MediaQuery.of(context).size.height * .73,
                    child: PageView(
                      onPageChanged: (pageIndex) => _pageChanged(pageIndex),
                      children: [
                        Container(
                          //color: Colors.red,
                          child: Column(
                            children: [
                              Spacer(flex: 3),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  child: SvgPicture.asset(
                                      "assets/images/logo.svg")),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Text(
                                  "إجعل قلبك مطمئن بذكر الله",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<ThemeProvider>(context)
                                          .textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Text(
                                  "“وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُمْ مَغْفِرَةً وَأَجْرًا عَظِيمًا”",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<ThemeProvider>(context)
                                          .textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Text(
                                  "“الَذِينَ آمَنُواْ وَتَطْمَئِنُ قُلُوبُهُم بِذِكْرِ اللَهِ أَلاَ بِذِكْرِ اللَهِ تَطْمَئِنُ الْقُلُوبُ”",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<ThemeProvider>(context)
                                          .textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(flex: 3),
                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.red,
                          child: Column(
                            children: [
                              Spacer(flex: 3),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  child: SvgPicture.asset(
                                      "assets/images/logo.svg")),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Text(
                                  "تنسى أذكارك اليومية ؟",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<ThemeProvider>(context)
                                          .textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Text(
                                  "بعد الآن لن تنساها",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<ThemeProvider>(context)
                                          .textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(flex: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Text(
                                  "تطبيق يذكرك بأذكارك اليومية ومتاح لكل الأوقات مع كل مايلزمك من تسبيح وذكر...",
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<ThemeProvider>(context)
                                          .textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(flex: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    child: Row(),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Spacer(flex: 3),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PagerDot(active: _selectedPage == 0),
                  PagerDot(active: _selectedPage == 1),
                ],
              ),
            ),
            Spacer(flex: 7),
          ],
        ),
      ),
    );
  }

  _pageChanged(int pageIndex) {
    setState(() {
      _selectedPage = pageIndex;
    });
  }
}

class PagerDot extends StatelessWidget {
  final bool active;
  const PagerDot({Key? key, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: active
              ? Provider.of<ThemeProvider>(context).kPrimary
              : Colors.white,
          border:
              Border.all(color: Provider.of<ThemeProvider>(context).kPrimary),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
