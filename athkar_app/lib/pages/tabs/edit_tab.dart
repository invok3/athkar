import 'package:athkar_app/pages/components/custom_button.dart';
import 'package:athkar_app/pages/main_screen.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTab extends StatefulWidget {
  final GlobalKey<State<MainScreen>> mainKey;
  const EditTab({Key? key, required this.mainKey}) : super(key: key);

  @override
  State<EditTab> createState() => _EditTabState();
}

class _EditTabState extends State<EditTab> {
  int _selectedAthkar = 0;

  var athkarList = [1, 2, 3, 4, 5];
  var showingList = [
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    MainScreenState mainScreenState =
        widget.mainKey.currentState as MainScreenState;
    return Column(
      children: [
        SizedBox(
          height: AppBar().preferredSize.height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: _size.width / 3,
              child: CustomOutlinedButton(
                  filled: true,
                  fillColor: Provider.of<ThemeProvider>(context)
                      .kPrimary
                      .withOpacity(_selectedAthkar == 0 ? 1 : .3),
                  text: "أذكار التطبيق",
                  ontap: () {
                    mainScreenState.setShowFloatingActionBtn(false);
                    setState(() {
                      _selectedAthkar = 0;
                    });
                  }),
            ),
            SizedBox(
              width: _size.width / 3,
              child: CustomOutlinedButton(
                  filled: true,
                  fillColor: Provider.of<ThemeProvider>(context)
                      .kPrimary
                      .withOpacity(_selectedAthkar == 1 ? 1 : .3),
                  text: "أذكاري",
                  ontap: () {
                    mainScreenState.setShowFloatingActionBtn(true);
                    setState(() {
                      _selectedAthkar = 1;
                    });
                  }),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _selectedAthkar == 0
                ? "اختر الاذكار التي ستظهر على الشاشة"
                : "بامكانك اضافة ادعية خاصة بك لتظهر على الشاشة",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.grey),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: _selectedAthkar == 0
                  ? _builtinAthkar(width: _size.width)
                  : _customAthkar(width: _size.width),
            ),
          ),
        ),
      ],
    );
  }

  _builtinAthkar({required double width}) {
    return athkarList
        .map((e) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * .1, vertical: 16),
              child: CustomOutlinedButton(
                  text: e.toString(), ontap: () => showingList[e] = false),
            ))
        .toList();
  }

  _customAthkar({required double width}) {
    return athkarList
        .map((e) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * .1, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  //color: Provider.of<ThemeProvider>(context).kPrimary,
                  border: Border.all(
                      width: 1,
                      color: Provider.of<ThemeProvider>(context).kPrimary),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        //color: Provider.of<ThemeProvider>(context).kPrimary,
                        border: Border.all(
                            width: 1,
                            color:
                                Provider.of<ThemeProvider>(context).kPrimary),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(49),
                            topLeft: Radius.circular(49)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert)),
                          Spacer(flex: 2),
                          Text("data\ndata\ndata\ndata\ndata\n"),
                          Spacer(flex: 3)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Spacer(flex: 1),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.edit_note)),
                          Spacer(flex: 8),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outlined)),
                          Spacer(flex: 1),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
  }
}
