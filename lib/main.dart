// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectmobile/LauncherPage.dart';
import 'package:projectmobile/Login.dart';
import 'package:projectmobile/pages/CategoryPage.dart';
import 'package:projectmobile/pages/FavoritePage.dart';
import 'package:projectmobile/pages/HomePage.dart';
import 'package:projectmobile/pages/ProfileView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:571085477803:android:7ab6616adf72815f26a4ee',
      apiKey: 'AIzaSyCy8yLn6JTGD_aIIQtKfv3CHdbf_8hQLw8',
      messagingSenderId: '571085477803',
      projectId: 'movieapp-8dbe0',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // To hide status bar and below buttons
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFD3D3D3),
      ),
      routes: {
        "/": (context) => LauncherPage(),
        "loginPage": (context) => Login(),
        "homePage": (context) => HomePage(),
        "categoryPage": (context) => CategoryPage(),
        "favoritePage": (context) => FavoritePage(),
        "ProfileView": (context) => ProfileView(),
      },
    );
  }
}
