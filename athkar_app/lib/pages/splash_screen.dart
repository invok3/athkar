import 'package:athkar_app/pages/pager_view/carousel_page1.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      return;
    }).whenComplete(() => _push());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Provider.of<ThemeProvider>(context).accentColor.withOpacity(.0),
            Provider.of<ThemeProvider>(context).accentColor.withOpacity(.50)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: Provider.of<ThemeProvider>(context).accentColor),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 26),
              child: Image.asset(
                "assets/images/logo.png",
                width: MediaQuery.of(context).size.width * .73,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _push() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CarouselPage1()));
  }
}
