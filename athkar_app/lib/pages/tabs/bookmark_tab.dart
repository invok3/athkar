import 'package:wathakren/consts.dart';
import 'package:wathakren/main.dart';
import 'package:wathakren/pages/components/custom_button.dart';
import 'package:wathakren/pages/specific_athkar_page.dart';
import 'package:wathakren/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkTab extends StatelessWidget {
  const BookmarkTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    final athkarCats = (jsonData["categories"] as List<dynamic>)
        .where((element) => isAthkar(element["data"]["title"] ?? "NaN"))
        .map((e) => e)
        .toList();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: Provider.of<SettingsProvider>(context)
            .myList
            .map((e) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _size.width / 20, horizontal: _size.width / 8),
                  child: CustomOutlinedButton(
                      filled: true,
                      text: e,
                      ontap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SpecificAthkarPage(
                                  category: athkarCats.firstWhere((element) =>
                                      element["data"]["title"] == e)))),
                      onLongPress: () => _remove(e, context)),
                ))
            .toList(),
      ),
    );
  }

  _remove(String e, BuildContext context) {
    Provider.of<SettingsProvider>(context, listen: false).removeFromMyList(e);
  }

  bool isAthkar(String title) {
    if (title == "أسماء الله الحسنى" || title == "النعم") {
      return false;
    }
    return true;
  }
}
