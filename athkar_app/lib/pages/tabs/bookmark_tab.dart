import 'package:wathakren/consts.dart';
import 'package:wathakren/pages/components/custom_button.dart';
import 'package:wathakren/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkTab extends StatelessWidget {
  const BookmarkTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    final routes = [
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
                      ontap: () => Navigator.pushNamed(
                          context,
                          (routes.firstWhere((element) => element.name == e))
                              .route),
                      onLongPress: () => _remove(e, context)),
                ))
            .toList(),
      ),
    );
  }

  _remove(String e, BuildContext context) {
    Provider.of<SettingsProvider>(context, listen: false).removeFromMyList(e);
  }
}
