import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/BrandScreen.dart';
import 'package:onlinestoreapp/view/CategoriesScreen.dart';
import 'package:onlinestoreapp/view/CommonScreen/GridviewDemo.dart';
import 'package:onlinestoreapp/view/CommonScreen/TimerScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/LanguagesScreen.dart';
import 'package:onlinestoreapp/view/MyOrderScreen.dart';
import 'package:onlinestoreapp/view/MyWishlistScreen.dart';
import 'package:onlinestoreapp/view/NotificationScreen.dart';
import 'package:onlinestoreapp/view/Theme/Theme_Manager.dart';
import 'package:onlinestoreapp/view/widget/change_theme_button_widget.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'drawerHeader.dart';

class navigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            width: 100,
            height: 200,
            child: drawerHeader(),
          ),
          //drawerHeaderGuard(),
          // createDrawerHeader(context),
          ListTile(
              leading: Image.asset(
                "assets/icon/home.png",color: getColorFromHex(ColorCode.Color_menu_icon),
                height: 27,
                width: 27,
              ),
              title: Text(string.home, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),

                    pageBuilder: (BuildContext context, _, __) {
                    return new HomeScreen();
                    }));

              }),

          ListTile(
              leading: Image.asset(
                "assets/icon/home.png",color: getColorFromHex(ColorCode.Color_menu_icon),
                height: 27,
                width: 27,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Theme Change", style: TextStyle(fontSize: 16, color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
                  ChangeThemeButtonWidget(),
                /*  Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (newValue){
                    _themeManager.toggleTheme(newValue);
                  })*/


                ],
              ),
             ),

          ListTile(
              leading: Image.asset(
                "assets/icon/notification.png",color: getColorFromHex(ColorCode.Color_menu_icon),
                height: 27,
                width: 27,
              ),
              title: Text(string.notification, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new NotificationScreen();
                    }));
              }
             ),

          ListTile(
            leading: Image.asset(
              "assets/icon/order.png",color: getColorFromHex(ColorCode.Color_menu_icon),
              height: 27,
              width: 27,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(string.my_order, style: TextStyle(fontSize: 16,
                    color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  margin: EdgeInsets.only(
                    right: 5.0,),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5,
                        color: getColorFromHex(ColorCode.Color_menu_icon)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("8",
                    style: TextStyle(
                      color: getColorFromHex(ColorCode.Color_menu_icon),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new MyOrderScreen();
                    }));
              }
          ),
          ListTile(
            leading: Image.asset(
              "assets/icon/heart.png",color: getColorFromHex(ColorCode.Color_menu_icon),
              height: 27,
              width: 27,
            ),
            title: Text(string.wishlist, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
               Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new MyWishlistScreen();
                    }));
              }
          ),
          ListTile(

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(string.products,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                      color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
                 Image.asset(
                  "assets/icon/line.png",color: isDark?getColorFromHex(ColorCode.Color_Black_drawerline):Colors.black12,
                  width: 15,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/icon/categories.png",color: getColorFromHex(ColorCode.Color_menu_icon),
              height: 27,
              width: 27,
            ),
            title: Text(string.categories, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new CategoriesScreen();
                    }));
              }
          ),
          ListTile(
              leading: Image.asset(
                "assets/icon/categories.png",
                color: getColorFromHex(ColorCode.Color_menu_icon),

                height: 27,
                width: 27,
              ),
              title: Text(string.brands, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new BrandScreen();
                    }));
              }),
          ListTile(

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(string.application_preferences,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                      color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
                Image.asset(
                  "assets/icon/line.png",color: isDark?getColorFromHex(ColorCode.Color_Black_drawerline):Colors.black12,
                  width: 15,
                ),
              ],
            ),
          ),
          ListTile(
              leading: Image.asset(
                "assets/icon/info.png",
                color: getColorFromHex(ColorCode.Color_menu_icon),
                height: 27,
                width: 27,
              ),
              title: Text(string.help_support, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                /* Navigator.pop(context);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => WalletScreen()));*/
              }),
          ListTile(
              leading: Image.asset(
                "assets/icon/settings.png",
                color: getColorFromHex(ColorCode.Color_menu_icon),
                height: 27,
                width: 27,
              ),
              title: Text(string.settings, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new GridViewDemo();
                    }));
              }),
          ListTile(
              leading: Image.asset(
                "assets/icon/language.png",
                color: getColorFromHex(ColorCode.Color_menu_icon),
                height: 27,
                width: 27,
              ),
              title: Text(string.languages, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(new PageRouteBuilder(
                    opaque: true,
                    transitionDuration: const Duration(milliseconds: 0),
                    pageBuilder: (BuildContext context, _, __) {
                      return new LanguagesScreen();
                    }));  }),


          ListTile(
            leading: Image.asset(
              "assets/icon/logout.png",
              color: getColorFromHex(ColorCode.Color_menu_icon),
              height: 27,
              width: 27,
            ),
            title: Text(string.log_out, style: TextStyle(fontSize: 16, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),

            onTap: () async {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      string.log_out,
                    ),
                    content: Text("Are you surenyou want to Logout?"),
                    actions: [
                      TextButton(
                        onPressed: ()  {
                          CommonWidget.getToast(string.log_out);

                          /* SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                    prefs.clear();
    */
                          /* Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginScreen()),
                                          ModalRoute.withName("/"));*/
                        },
                        child: const Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('No'),
                      ),
                    ],
                  ));
            },
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
