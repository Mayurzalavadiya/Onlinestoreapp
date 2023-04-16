import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/ManProductScreen.dart';
import 'package:onlinestoreapp/view/MyWishlistScreen.dart';
import 'package:onlinestoreapp/view/ProductDetailsScreen.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import 'package:onlinestoreapp/view/SignUpScreen.dart';
import 'package:onlinestoreapp/view/WomenProductScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/BottomNavigationbar.dart';
import 'package:onlinestoreapp/view/navigation_drawer/drawerHeader.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  LanguagesScreenState createState() => LanguagesScreenState();
}

class LanguagesScreenState extends State<LanguagesScreen>
    with SingleTickerProviderStateMixin {

  String list_colour = "#eaeae6";

  bool isSelected1 = true;
  /* bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
*/
  final drawer_icon = "assets/icon/paragraph.png";
  final delete_icon = "assets/icon/delete.png";
  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
  var scaffoldkey = GlobalKey<ScaffoldState>();


/*  final List<String> name = [
    "Sh", "Sweater", "Jacket", "Socks", "Trousers", "Shirt","Sweater", "Jacket", "Socks", "Trousers"
  ];*/

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      key: scaffoldkey,
      drawer: navigationDrawer(),
      backgroundColor: Colors.white,


      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
        title: Text(string.languages, style: TextStyle(fontWeight: FontWeight.w700,
            color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
        titleSpacing: 30,
        actions: <Widget>[
          Center(


            child: Container(
              width: 100,
              padding: const EdgeInsets.only(right: 15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(new PageRouteBuilder(
                              opaque: true,
                              transitionDuration: const Duration(milliseconds: 0),
                              pageBuilder: (BuildContext context, _, __) {
                                return new CartScreen();
                              }));
                        },
                        child:
                        Container(child: Image.asset(
                          "assets/icon/shopping_cart.png",
                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                          height: 30,
                          width: 30,
                        ),),),


                    ],
                  ),
                  //  if (constantKey.cartCount != 0)
                  Positioned(
                    top: 10,
                    right: 14,
                    child: Container(

                      padding: EdgeInsets.only(left:
                      5, right: 5, top: 2, bottom: 2
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getColorFromHex("#00C4D3")),
                      alignment: Alignment.center,
                      child: Text("0", style: TextStyle(fontSize: 12, color: isDark?Colors.black:Colors.white),),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Center(
            child: InkWell(
              child: Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.only(right: 15),
                  child: profile != null
                      ? ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        profile!,
                        fit: BoxFit.fill,
                      ))
                      : ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset("assets/image/blank.webp"))),
              onTap: () {

              },
            ),
          ),
        ],
        leadingWidth: 40,
        leading: InkWell(
          child: Container(
            padding: EdgeInsets.only(left: 15),

            child: Image.asset(drawer_icon, color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),),
          ),
          onTap: () {
            scaffoldkey.currentState?.openDrawer();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.1,
                        margin: EdgeInsets.only(left: 18, top: 10),
                        decoration: BoxDecoration(
                            color:  isDark?Colors.black54:getColorFromHex(ColorCode.Color_White),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color:  isDark?Colors.white24:Colors.black12.withOpacity(0.3),
                                spreadRadius: 1,

                                blurRadius: 5,)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Image.asset(
                                "assets/icon/search.png",
                                color:  isDark?Colors.white:getColorFromHex(
                                    ColorCode.Color_darkblue),
                                height: 20,
                                width: 20,
                              ),),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Flexible(
                                child: TextFormField(
                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: string.search,
                                        hintStyle: TextStyle(
                                          color:  isDark?Colors.white:getColorFromHex("#C2D2D3"),
                                          fontSize: 15,
                                        )
                                    )),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.only(right: 15),

                                child: Image.asset(
                                  "assets/icon/equalizer.png",
                                  color: isDark?Colors.white:getColorFromHex(
                                      ColorCode.Color_menu_icon),
                                  height: 20,
                                  width: 20,
                                ),),
                              onTap: () {

                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,

                        children: <Widget>[

                          SizedBox(width: 10,),

                          Container(

                            height: 25,
                            width: 25,
                            child: Image.asset("").AddImage(
                                "assets/icon/translate.png", 0, 0,
                                isDark?Colors.white:getColorFromHex(
                                    ColorCode.Color_sapphireblue)),),


                          SizedBox(width: 25,),


                          Container(
                            child: Text(
                              string.app_language,
                              style: TextStyle(
                                  fontSize: 20,
                                  color:   isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ),]),
                  ),

                  ListView.builder(

                      padding: EdgeInsets.only(top:15),
                      shrinkWrap: true,
                      itemCount: 15,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (
                          BuildContext context,
                          int index,
                          ) {
                        return  Card(
                              elevation: 0,
                              margin: EdgeInsets.only(bottom: 8),
                              color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white24,
                              child: Row(

                                children: [
                                  const SizedBox(width: 20,),
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      height: 45,
                                      width: 45,
                                      child: profile != null
                                          ? ClipRRect(
                                          borderRadius: BorderRadius.circular(50.0),
                                          child: Image.network(
                                            profile!,
                                            fit: BoxFit.fill,
                                          ))
                                          : ClipRRect(
                                          borderRadius: BorderRadius.circular(50.0),
                                          child: Image.asset("assets/image/blank.webp"))),

                                  const SizedBox(width: 15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                              string.english,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w500,
                                                  fontSize: 18,
                                                  color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue)))),

                                      Text(
                                          string.english,
                                          maxLines: 2,


                                          overflow: TextOverflow
                                              .ellipsis,
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight
                                                  .normal,
                                              fontSize: 14,
                                              color: isDark?Colors.white70:getColorFromHex("#6C9BA1")))
                                    ],
                                  ),
                                ],
                              ),);}),

  ])        ),
        ),
        ),

    );
  }
}
