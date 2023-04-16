import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';


const COLOUR_PRIMARY = Colors.deepOrangeAccent;

ThemeData lightTheme = ThemeData(
  brightness:  Brightness.light,
      primaryColor: COLOUR_PRIMARY,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.grey),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
    )
);



ThemeData darkTheme = ThemeData(
  brightness:  Brightness.dark,
      accentColor: Colors.white,
    primaryColor: getColorFromHex(ColorCode.Color_darkmode),

);
