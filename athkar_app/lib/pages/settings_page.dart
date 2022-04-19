import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shape: customRoundedRectangleBorder,
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
        automaticallyImplyLeading: false,
        title: Text("الإعدادات"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CustomOutlinedButton(
                  text: "موعد التنبيهات لأذكار الصباح",
                  ontap: () {},
                  childCentered: false,
                  icon: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "5:00",
                            textScaleFactor: .8,
                            style: TextStyle(
                                color: Provider.of<ThemeProvider>(context)
                                    .accentColor),
                          ),
                          SizedBox(
                            height: 4,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8),
                        child: SvgPicture.asset("assets/icons/goto.svg"),
                      )
                    ],
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "موعد التنبيهات لأذكار المساء",
                  ontap: () {},
                  childCentered: false,
                  icon: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "18:00",
                            textScaleFactor: .8,
                            style: TextStyle(
                                color: Provider.of<ThemeProvider>(context)
                                    .accentColor),
                          ),
                          SizedBox(
                            height: 4,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8),
                        child: SvgPicture.asset("assets/icons/goto.svg"),
                      )
                    ],
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "إيقاف الأذكار الظاهرة على الشاشة",
                  ontap: () {},
                  childCentered: false,
                  icon: Switch(value: false, onChanged: null),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "الإختفاء التلقائي",
                  subText: "تختفي الأذكار تلقائياً بعج 15 ثانية",
                  ontap: () {},
                  childCentered: false,
                  icon: Switch(value: false, onChanged: null),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تفعيل التنبيهات",
                  ontap: () {},
                  childCentered: false,
                  icon: Switch(value: false, onChanged: null),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تفعيل الإهتزاز عند القراءة",
                  ontap: () {},
                  childCentered: false,
                  icon: Switch(value: false, onChanged: null),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تفعيل القراءة الذاتية",
                  subText: "إظهار لون أحمر عند ظهور الأذكار",
                  ontap: () {},
                  childCentered: false,
                  icon: Switch(value: false, onChanged: null),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تغيير لون التطبيق",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تغيير نوع الخط",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تغيير حجم الخط",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تغيير لون الأذكار الظاهرة على الشاشة",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "إزالة الإعلانات و دعم التطبيق",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تقييم التطبيق",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تواصل معنا",
                  ontap: () {},
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset("assets/icons/goto.svg"),
                  ),
                  boldness: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
