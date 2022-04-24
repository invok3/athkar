import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:athkar_cp/consts.dart';
import 'package:athkar_cp/pages/tabs/about_tab.dart';
import 'package:athkar_cp/pages/tabs/categories_tab.dart';
import 'package:athkar_cp/pages/tabs/edit_category_tab.dart';
import 'package:athkar_cp/pages/tabs/edit_story_tab.dart';
import 'package:athkar_cp/pages/tabs/messages_tab.dart';
import 'package:athkar_cp/pages/tabs/notification_tab.dart';
import 'package:athkar_cp/pages/tabs/preview_page.dart';
import 'package:athkar_cp/pages/tabs/profile_tab.dart';
import 'package:athkar_cp/pages/tabs/stories_tab.dart';
import 'package:athkar_cp/providers/reading_provider.dart';
import 'package:athkar_cp/providers/user_provider.dart';
import 'package:athkar_cp/state_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyClxoWlPYtwz6j3ao2Wx08TCynkqqU5RTQ",
        authDomain: "athkar-app-e6430.firebaseapp.com",
        projectId: "athkar-app-e6430",
        storageBucket: "athkar-app-e6430.appspot.com",
        messagingSenderId: "289097211816",
        appId: "1:289097211816:web:5cac57f876a3858c67079d",
        measurementId: "G-BMBPH2CXC1"),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ChangeNotifierProvider<Reading>(create: (_) => Reading())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('ar', 'SA'),
      supportedLocales: [
        Locale('ar', 'SA'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      color: kPrimary,
      theme: ThemeData(primaryColor: kPrimary, primarySwatch: kPrimary),
      darkTheme: ThemeData(primaryColor: kPrimary, primarySwatch: kPrimary),
      debugShowCheckedModeBanner: false,
      //showPerformanceOverlay: true,
      routes: {
        "/": (context) => StateManager(),
        CategoriesTab.routeName: (context) => CategoriesTab(),
        StoriesTab.routeName: (context) => StoriesTab(),
        EditCategoryTab.routeName: (context) => EditCategoryTab(),
        EditStoryTab.routeName: (context) => EditStoryTab(),
        ProfileTab.routeName: (context) => ProfileTab(),
        PreviewPage.routeName: (context) => PreviewPage(),
        AboutTab.routeName: (context) => AboutTab(),
        MessagesTab.routeName: (context) => MessagesTab(),
        NotificationTab.routeName: (context) => NotificationTab()
      },
      initialRoute: "/",
    );
  }
}
