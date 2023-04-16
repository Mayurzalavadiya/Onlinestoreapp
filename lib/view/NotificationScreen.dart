import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/MyProfileScreen.dart';
import 'package:onlinestoreapp/view/MyWishlistScreen.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import 'package:onlinestoreapp/view/SignUpScreen.dart';
import 'package:onlinestoreapp/view/Theme/Theme_Manager.dart';
import 'package:onlinestoreapp/view/navigation_drawer/BottomNavigationbar.dart';
import 'package:onlinestoreapp/view/navigation_drawer/drawerHeader.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen>
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

  final List<String> name = [
    "Card",
    "Sports",
    "Refurbished",
    "Royal",
    "cffs",
    "nhgs",
    "Royal Enfield",
    "Mobiles""Card",
    "Sports",
    "Refurbished",
    "Royal",
    "cffs",
    "nhgs",
    "Royal Enfield",
    "Mobiles"
        "Card",
    "Sports",
    "Refurbished",
    "Royal",
    "cffs",
    "nhgs",
    "Royal Enfield",
    "Mobiles"
  ];



  @override
  Widget build(BuildContext context) {

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        key: scaffoldkey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: getColorFromHex("#12e3ff"),
        elevation: 3,

        splashColor: getColorFromHex(ColorCode.Color_sapphireblue),
        child: Container(
            height: 30,
            width: 30,
            child: Image.asset("assets/icon/home.png",color: Colors.black,)),
        onPressed: () {

          Navigator.of(context).push(new PageRouteBuilder(
              opaque: true,
              transitionDuration: const Duration(milliseconds: 0),
              pageBuilder: (BuildContext context, _, __) {
                return new HomeScreen();
              }));
        },
      ),
        drawer: navigationDrawer(),
        backgroundColor: Colors.white,
        

        appBar: AppBar(
          elevation: 0,
          backgroundColor: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
          title: Text(string.notification,style: TextStyle(  fontWeight: FontWeight.w700,
              color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
          titleSpacing: 30,
          actions: <Widget>[
            Center(

              child: InkWell(
                onTap: () {

                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.only(right: 15),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(child:  Image.asset(
                            "assets/icon/shopping_cart.png",
                            color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                            height: 30,
                            width: 30,
                          ),),


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
                              border: Border.all(
                                color: Colors.white,
                                width: 01,
                              ),
                              shape: BoxShape.circle,
                              color: getColorFromHex("#00C4D3")),
                          alignment: Alignment.center,
                          child: Text("0", style: TextStyle(fontSize: 12),),
                        ),
                      ),

                    ],
                  ),
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
          leading:  InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 15),

              child: Image.asset(drawer_icon,color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),),
            ),
            onTap: (){
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

                  if(name.length == "")

                  const SizedBox(height: 10,),
     ListView.builder(

         padding: EdgeInsets.only(top:15),
         shrinkWrap: true,
         itemCount: 15,
         physics: NeverScrollableScrollPhysics(),
         itemBuilder: (
               BuildContext context,
               int index,
               ) {
           return Dismissible(
                 key: UniqueKey(),
                 background: slideLeftBackground(),
                 direction: DismissDirection.endToStart,
                /* onDismissed: (direction) async {
                   if (direction == DismissDirection.endToStart) {
                     final bool res = await showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return AlertDialog(
                             content: Text(
                                 "Are you sure you want to delete ${name[index]}?"),
                             actions: <Widget>[
                               FlatButton(
                                 child: Text(
                                   "Cancel",
                                   style: TextStyle(color: Colors.black),
                                 ),
                                 onPressed: () {
                                   Navigator.of(context).pop();
                                 },
                               ),
                               FlatButton(
                                 child: Text(
                                   "Delete",
                                   style: TextStyle(color: Colors.red),
                                 ),
                                 onPressed: () {
                                   // TODO: Delete the item from DB etc..
                                   setState(() {
                                     name.removeAt(index);
                                   });
                                   Navigator.of(context).pop();
                                 },
                               ),
                             ],
                           );
                         });
                     return ;
                   }
                 },*/
                 child: Card(
                   elevation: 0,
                   margin: EdgeInsets.only(bottom: 8),
                   color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white24,
                   child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const SizedBox(width: 20,),
                     Container(
                       margin: EdgeInsets.symmetric(vertical: 8),
                         height: 80,
                         width: 75,
                         child: profile != null
                             ? ClipRRect(
                             borderRadius: BorderRadius.circular(10.0),
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
                           width: MediaQuery.of(context).size.width/1.5,
                             margin: EdgeInsets.only(top: 10,bottom: 3),
                             child: Text(
                                 string.details,
                                 maxLines: 2,
                                 overflow: TextOverflow
                                     .ellipsis,
                                 style: TextStyle(
                                     fontWeight:
                                     FontWeight
                                         .w800,
                                     fontSize: 18,
                                     color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue)))),

                          Text(
                             "33min ago",
                             maxLines: 2,


                             overflow: TextOverflow
                                 .ellipsis,
                             style: TextStyle(
                                 fontWeight:
                                 FontWeight
                                     .normal,
                                 fontSize: 18,
                                 color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue)))
                       ],
                     ),
                   ],
                 ),));}),
                ],
              ),

            ),
          ),
        ),
      bottomNavigationBar:BottomAppBar(
          elevation: 1,
          shape: CircularNotchedRectangle(),
          color: isDark?getColorFromHex(ColorCode.Color_darkmode): Colors.white,
          notchMargin: 0.0,

          child: Container(
            height: 50,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(

                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage("assets/icon/notification.png",0,0,
                        isSelected1
                            ? getColorFromHex(
                            ColorCode.Color_blue)
                            : getColorFromHex(
                            ColorCode.Color_sapphireblue)),),
                  onTap: (){
                    setState(() {
                      isSelected1 = true;


                    });
                  },
                ),

                InkWell(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage("assets/icon/employee.png",0,0,
                        isDark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue),
                            ),),
                  onTap: () {
    setState(() {


    Navigator.of(context).push(new PageRouteBuilder(
    opaque: true,
    transitionDuration: const Duration(milliseconds: 0),
    pageBuilder: (BuildContext context, _, __) {
    return new MyProfileScreen();
    }));
    });},
                ),

                const SizedBox(width: 50,),


                InkWell(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage("assets/icon/chat.png",0,0,
                        isDark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)
                           ),),
                  onTap: (){
                    setState(() {


                      Navigator.of(context).push(new PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 0),
                          pageBuilder: (BuildContext context, _, __) {
                            return new NotificationScreen();
                          }));
                    });
                  },
                ),


                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage("assets/icon/heart.png",0,0,
                        isDark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)
                            ),),
                  onTap: (){
                    setState(() {
                      Navigator.of(context).push(new PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 0),
                          pageBuilder: (BuildContext context, _, __) {
                            return new MyWishlistScreen();
                          }));

                    });
                  },),

              ],
            ),
          )
      ),
    );


  }

  slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
             Container(
                height: 25,
                width: 25,
                    child: Image.asset(delete_icon)),
          /*  Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),*/
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }





}
