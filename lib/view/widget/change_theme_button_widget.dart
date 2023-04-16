import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/view/Theme/Theme_Manager.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final themeProvider = Provider.of<ThemeManager>(context);

    return Switch.adaptive(
      activeColor:getColorFromHex(ColorCode.Color_blue),
      activeTrackColor:Colors.white,
      inactiveThumbColor: getColorFromHex(ColorCode.Color_blue),
      inactiveTrackColor: Colors.grey,
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        print("Value+++++"+value.toString());
        final provider = Provider.of<ThemeManager>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
