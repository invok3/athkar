import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/color_select_page.dart';
import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/providers/settings_provider.dart';
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
    bool _canShowOverlay =
        Provider.of<SettingsProvider>(context).canShowOverlay;
    bool _autoHide = Provider.of<SettingsProvider>(context).autoHide;
    bool _canShowNotifications =
        Provider.of<SettingsProvider>(context).canShowNotifications;
    bool _vibrateOnReading =
        Provider.of<SettingsProvider>(context).vibrateOnReading;
    bool _selfReading = Provider.of<SettingsProvider>(context).selfReading;
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
                  ontap: _setDayAthkarTime,
                  childCentered: false,
                  icon: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            Provider.of<SettingsProvider>(context)
                                .dayAthkarTime,
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
                        child: SvgPicture.asset(
                          "assets/icons/goto.svg",
                          color: Provider.of<ThemeProvider>(context).kPrimary,
                        ),
                      )
                    ],
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "موعد التنبيهات لأذكار المساء",
                  ontap: _setNightAthkarTime,
                  childCentered: false,
                  icon: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            Provider.of<SettingsProvider>(context)
                                .nightAthkarTime,
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
                        child: SvgPicture.asset(
                          "assets/icons/goto.svg",
                          color: Provider.of<ThemeProvider>(context).kPrimary,
                        ),
                      )
                    ],
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "إيقاف الأذكار الظاهرة على الشاشة",
                  ontap: () => _toggleCanShowOverlay(!_canShowOverlay),
                  childCentered: false,
                  icon: Switch(
                    value: _canShowOverlay,
                    onChanged: _toggleCanShowOverlay,
                  ),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "الإختفاء التلقائي",
                  subText: "تختفي الأذكار تلقائياً بعج 15 ثانية",
                  ontap: () => _toggleAutoHide(!_autoHide),
                  childCentered: false,
                  icon: Switch(value: _autoHide, onChanged: _toggleAutoHide),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تفعيل التنبيهات",
                  ontap: () =>
                      _toggleCanShowNotifications(!_canShowNotifications),
                  childCentered: false,
                  icon: Switch(
                      value: _canShowNotifications,
                      onChanged: _toggleCanShowNotifications),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تفعيل الإهتزاز عند القراءة",
                  ontap: () => _toggleVibrateOnReading(!_vibrateOnReading),
                  childCentered: false,
                  icon: Switch(
                      value: _vibrateOnReading,
                      onChanged: _toggleVibrateOnReading),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تفعيل القراءة الذاتية",
                  subText: "إظهار لون أحمر عند ظهور الأذكار",
                  ontap: () => _toggleSelfReading(!_selfReading),
                  childCentered: false,
                  icon: Switch(
                      value: _selfReading, onChanged: _toggleSelfReading),
                  boldness: FontWeight.bold,
                ),
                SizedBox(height: 24),
                CustomOutlinedButton(
                  text: "تغيير لون التطبيق",
                  ontap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ColorSelectPage())),
                  childCentered: false,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8),
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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
                    child: SvgPicture.asset(
                      "assets/icons/goto.svg",
                      color: Provider.of<ThemeProvider>(context).kPrimary,
                    ),
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

  _setDayAthkarTime() async {
    TimeOfDay? selectedDayTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(
                Provider.of<SettingsProvider>(context, listen: false)
                    .dayAthkarTime
                    .split(":")
                    .first),
            minute: int.parse(
                Provider.of<SettingsProvider>(context, listen: false)
                    .dayAthkarTime
                    .split(":")
                    .last)));
    selectedDayTime != null
        ? Provider.of<SettingsProvider>(context, listen: false).setDayAthkarTime(
            "${selectedDayTime.hour}:${selectedDayTime.minute > 9 ? selectedDayTime.minute : '0' + selectedDayTime.minute.toString()}")
        : null;
  }

  _setNightAthkarTime() async {
    TimeOfDay? selectedNightTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(
                Provider.of<SettingsProvider>(context, listen: false)
                    .nightAthkarTime
                    .split(":")
                    .first),
            minute: int.parse(
                Provider.of<SettingsProvider>(context, listen: false)
                    .nightAthkarTime
                    .split(":")
                    .last)));
    selectedNightTime != null
        ? Provider.of<SettingsProvider>(context, listen: false).setNightAthkarTime(
            "${selectedNightTime.hour}:${selectedNightTime.minute > 9 ? selectedNightTime.minute : '0' + selectedNightTime.minute.toString()}")
        : null;
  }

  void _toggleCanShowOverlay(bool value) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setCanShowOverlay(value);
  }

  void _toggleAutoHide(bool value) {
    Provider.of<SettingsProvider>(context, listen: false).setAutoHide(value);
  }

  void _toggleCanShowNotifications(bool value) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setCanShowNotifications(value);
  }

  void _toggleVibrateOnReading(bool value) {
    Provider.of<SettingsProvider>(context, listen: false)
        .setVibrateOnReading(value);
  }

  void _toggleSelfReading(bool value) {
    Provider.of<SettingsProvider>(context, listen: false).setSelfReading(value);
  }
}
