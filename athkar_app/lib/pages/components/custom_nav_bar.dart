import 'package:athkar_app/consts.dart';
import 'package:athkar_app/pages/main_screen.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  final GlobalKey<State<BottomNavigationBar>> botNavBarKey;
  final GlobalKey<State<MainScreen>> mainKey;

  const CustomNavBar({
    required this.botNavBarKey,
    required this.mainKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreenState mainScreenState = mainKey.currentState as MainScreenState;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Provider.of<ThemeProvider>(context).kPrimary,
      ),
      child: Stack(
        children: [
          BottomNavigationBar(
            key: botNavBarKey,
            items: [
              BottomNavigationBarItem(icon: SizedBox(), label: ""),
              BottomNavigationBarItem(icon: SizedBox(), label: ""),
              BottomNavigationBarItem(icon: SizedBox(), label: ""),
              BottomNavigationBarItem(icon: SizedBox(), label: ""),
            ],
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: Colors.white.withOpacity(.5)),
            iconSize: 32,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onTap: (x) {
              mainScreenState.reAnimate(x);
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    (botNavBarKey.currentWidget! as BottomNavigationBar)
                        .onTap!(0);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mainScreenState.selectedIndex() == 0
                        ? Icon(Icons.home,
                            size: appBarHeight() - 16, color: Colors.white)
                        : Icon(Icons.home_outlined,
                            size: appBarHeight() - 16,
                            color: Colors.white.withOpacity(.5)),
                  ),
                ),
                Spacer(flex: 2),
                GestureDetector(
                  onTap: () {
                    (botNavBarKey.currentWidget! as BottomNavigationBar)
                        .onTap!(1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mainScreenState.selectedIndex() == 1
                        ? Icon(Icons.edit,
                            size: appBarHeight() - 16, color: Colors.white)
                        : Icon(Icons.edit_outlined,
                            size: appBarHeight() - 16,
                            color: Colors.white.withOpacity(.5)),
                  ),
                ),
                Spacer(flex: 2),
                GestureDetector(
                  onTap: () {
                    (botNavBarKey.currentWidget! as BottomNavigationBar)
                        .onTap!(2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mainScreenState.selectedIndex() == 2
                        ? Icon(Icons.share,
                            size: appBarHeight() - 16, color: Colors.white)
                        : Icon(Icons.share_outlined,
                            size: appBarHeight() - 16,
                            color: Colors.white.withOpacity(.5)),
                  ),
                ),
                Spacer(flex: 2),
                GestureDetector(
                  onTap: () {
                    (botNavBarKey.currentWidget! as BottomNavigationBar)
                        .onTap!(3);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mainScreenState.selectedIndex() == 3
                        ? Icon(Icons.bookmark,
                            size: appBarHeight() - 16, color: Colors.white)
                        : Icon(Icons.bookmark_outlined,
                            size: appBarHeight() - 16,
                            color: Colors.white.withOpacity(.5)),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
