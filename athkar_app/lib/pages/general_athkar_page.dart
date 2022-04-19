import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class GeneralAthkarPage extends StatefulWidget {
  const GeneralAthkarPage({Key? key}) : super(key: key);

  @override
  State<GeneralAthkarPage> createState() => _GeneralAthkarPageState();
}

class _GeneralAthkarPageState extends State<GeneralAthkarPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: customRoundedRectangleBorder,
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
        leading: SizedBox(
            //width: 32,
            ),
        automaticallyImplyLeading: false,
        title: Text(
          "أذكار متنوعة",
          // overflow: TextOverflow.visible,
        ),
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: 32,
        actions: [
          //mod - + not
          SizedBox(width: 32),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/moon.svg",
                color: Provider.of<ThemeProvider>(context).kPrimary,
              ),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove),
              visualDensity: VisualDensity.compact),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              vertical: _size.width / 10, horizontal: _size.width / 10),
          child: Column(
            children: [
              CustomOutlinedButton(
                filled: true,
                text: "أذكار الإستيقاظ",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار النوم",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار الآذان",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار الصلاة",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار بعد الصلاة",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار المسجد",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار الوضوء",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار المنزل",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "أذكار الطعام",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
              SizedBox(height: 24),
              CustomOutlinedButton(
                filled: true,
                text: "فضل الذكر",
                fillColor: Provider.of<ThemeProvider>(context).elevationColor,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
