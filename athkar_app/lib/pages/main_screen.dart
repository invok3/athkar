import 'package:athkar_app/pages/components/custom_nav_bar.dart';
import 'package:athkar_app/pages/tabs/bookmark_tab.dart';
import 'package:athkar_app/pages/tabs/edit_tab.dart';
import 'package:athkar_app/pages/tabs/main_tab.dart';
import 'package:athkar_app/pages/tabs/share_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<State<BottomNavigationBar>> botNavBarKey = GlobalKey();
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
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
    });
  }

  int selectedIndex() {
    return _selectedIndex;
  }

  pageSelector({required Size size}) {
    switch (_selectedIndex) {
      case 1:
        return EditTab();
      case 2:
        return ShareTab();
      case 3:
        return BookmarkTab();
      default:
        return MainTab(size: size);
    }
  }
}
