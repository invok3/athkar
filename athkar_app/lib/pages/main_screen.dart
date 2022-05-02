import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:wathakren/consts.dart';
import 'package:wathakren/pages/components/custom_nav_bar.dart';
import 'package:wathakren/pages/tabs/bookmark_tab.dart';
import 'package:wathakren/pages/tabs/edit_tab.dart';
import 'package:wathakren/pages/tabs/main_tab.dart';
import 'package:wathakren/pages/tabs/share_tab.dart';
import 'package:wathakren/providers/settings_provider.dart';
import 'package:wathakren/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  bool _canShowFloatingActBtn = false;

  GlobalKey<EditTabState> editTabKey = GlobalKey<EditTabState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<State<BottomNavigationBar>> botNavBarKey = GlobalKey();
    Size _size = MediaQuery.of(context).size;
    checkPermession();
    return Scaffold(
      appBar: _selectedIndex == 3
          ? AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
              title: Text("أذكاري اليومية"),
              centerTitle: false,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _selectedIndex == 1 && _canShowFloatingActBtn
          ? FloatingActionButton(
              onPressed: () {
                editTabKey.currentState?.addCustomAthkar();
              },
              child: Icon(Icons.add),
            )
          : _selectedIndex == 3
              ? FloatingActionButton(
                  onPressed: () {
                    addToBookmark();
                  },
                  child: Icon(Icons.add),
                )
              : null,
      bottomNavigationBar: CustomNavBar(
        botNavBarKey: botNavBarKey,
        mainKey: widget.key as GlobalKey<State<MainScreen>>,
      ),
      body: SafeArea(
        child: pageSelector(size: _size),
      ),
    );
  }

  void reAnimate(int x) {
    setState(() {
      _selectedIndex = x;
      _canShowFloatingActBtn = false;
    });
  }

  int selectedIndex() {
    return _selectedIndex;
  }

  pageSelector({required Size size}) {
    switch (_selectedIndex) {
      case 1:
        return EditTab(
          mainKey: widget.key as GlobalKey<State<MainScreen>>,
          key: editTabKey,
        );
      case 2:
        return ShareTab();
      case 3:
        return BookmarkTab();
      default:
        return MainTab(size: size);
    }
  }

  void setShowFloatingActionBtn(bool can) {
    setState(() {
      _canShowFloatingActBtn = can;
    });
  }

  void addToBookmark() async {
    var routes = [
      GeneralAthkar.day,
      GeneralAthkar.night,
      GeneralAthkar.wake,
      GeneralAthkar.sleep,
      GeneralAthkar.azan,
      GeneralAthkar.salat,
      GeneralAthkar.afterSalat,
      GeneralAthkar.masjid,
      GeneralAthkar.wodoo,
      GeneralAthkar.manzil,
      GeneralAthkar.taam,
    ];
    if (routes
        .where((element) =>
            !Provider.of<SettingsProvider>(context, listen: false)
                .myList
                .contains(element.name))
        .isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Text(
            "لقد قمت بإضافة كل الأذكار مسبقاً",
            style: TextStyle(
                color: Colors.red[700],
                fontFamily: "Cairo",
                fontSize: 21,
                fontWeight: FontWeight.bold),
          )));
      return;
    }
    String? toAdd = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: routes
                    .where((element) =>
                        !Provider.of<SettingsProvider>(context, listen: false)
                            .myList
                            .contains(element.name))
                    .map((e) => ListTile(
                          title: Text(e.name),
                          onTap: () => Navigator.pop(context, e.name),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
    if (toAdd == null) {
      return;
    } else {
      Provider.of<SettingsProvider>(context, listen: false).addToMyList(toAdd);
    }
  }

  void checkPermession() async {
    var p = await AwesomeNotifications().isNotificationAllowed();
    if (!p) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }
}
