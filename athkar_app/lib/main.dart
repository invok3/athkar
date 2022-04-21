import 'package:athkar_app/pages/pager_view/carousel_page1.dart';
import 'package:athkar_app/providers/settings_provider.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.brown,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Provider.of<ThemeProvider>(context).kPrimary,
      title: 'Flutter Demo',
      locale: Locale("ar", "UA"),
      supportedLocales: [Locale("ar", "UA")],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        // colorSchemeSeed: Provider.of<ThemeProvider>(context).kPrimary,
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Provider.of<ThemeProvider>(context).kPrimary,
            onPrimary: Provider.of<ThemeProvider>(context).kPrimary,
            secondary: Provider.of<ThemeProvider>(context).accentColor,
            onSecondary: Provider.of<ThemeProvider>(context).kPrimary,
            error: Provider.of<ThemeProvider>(context).kPrimary,
            onError: Provider.of<ThemeProvider>(context).accentColor,
            background: Colors.white,
            onBackground: Provider.of<ThemeProvider>(context).kPrimary,
            surface: Colors.white,
            onSurface: Provider.of<ThemeProvider>(context).kPrimary),
        fontFamily: 'Cairo',
        primarySwatch:
            MaterialColor(Provider.of<ThemeProvider>(context).kPrimary.value, {
          50: Provider.of<ThemeProvider>(context).kPrimary,
          100: Provider.of<ThemeProvider>(context).kPrimary,
          200: Provider.of<ThemeProvider>(context).kPrimary,
          300: Provider.of<ThemeProvider>(context).kPrimary,
          400: Provider.of<ThemeProvider>(context).kPrimary,
          500: Provider.of<ThemeProvider>(context).kPrimary,
          600: Provider.of<ThemeProvider>(context).kPrimary,
          700: Provider.of<ThemeProvider>(context).kPrimary,
          800: Provider.of<ThemeProvider>(context).kPrimary,
          900: Provider.of<ThemeProvider>(context).kPrimary,
        }),
      ),
      // home: MainScreen(key: GlobalKey<State<MainScreen>>()),
      home: CarouselPage1(),
    );
  }
}
