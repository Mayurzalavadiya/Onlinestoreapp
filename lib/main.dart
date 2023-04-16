import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/view/SplashScreen.dart';
import 'package:onlinestoreapp/view/Theme/Theme_Manager.dart';
import 'package:onlinestoreapp/view/Theme/theme_provider.dart';

import 'package:provider/provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
 _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MyApp> {


  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
  create: (context) => ThemeManager(),
  builder: (context, _) {
  final _themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  lightTheme,
      darkTheme:darkTheme,
      themeMode: _themeManager.themeMode,
      home:  SplashScreen(),

    );
  }
  );
}



