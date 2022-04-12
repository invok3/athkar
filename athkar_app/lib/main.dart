import 'package:athkar_app/pages/main_screen.dart';
import 'package:athkar_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.brown));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
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
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Provider.of<ThemeProvider>(context).kPrimary,
            onPrimary: Provider.of<ThemeProvider>(context).kPrimary,
            secondary: Provider.of<ThemeProvider>(context).accentColor,
            onSecondary: Provider.of<ThemeProvider>(context).kPrimary,
            error: Provider.of<ThemeProvider>(context).kPrimary.shade700,
            onError: Provider.of<ThemeProvider>(context).accentColor,
            background: Colors.white,
            onBackground: Provider.of<ThemeProvider>(context).kPrimary,
            surface: Colors.white,
            onSurface: Provider.of<ThemeProvider>(context).kPrimary),
        fontFamily: 'Cairo',
        primarySwatch: Provider.of<ThemeProvider>(context).kPrimary,
      ),
      home: MainScreen(
        key: GlobalKey<State<MainScreen>>(),
      ),
    );
  }
}
