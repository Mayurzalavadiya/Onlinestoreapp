import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/CommonScreen/CustomAnimationContainer.dart';
import 'package:onlinestoreapp/view/CommonScreen/TimerScreen.dart';
import 'package:onlinestoreapp/view/MyProfileScreen.dart';
import 'package:onlinestoreapp/view/MyWishlistScreen.dart';

import 'package:onlinestoreapp/view/NotificationScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/BottomNavigationbar.dart';
import 'package:onlinestoreapp/view/navigation_drawer/Right_navigationDrawer.dart';
import 'package:onlinestoreapp/view/navigation_drawer/drawerHeader.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Theme/Theme_Manager.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool  Dark = false;

  // Drawer
  var scaffoldkey = GlobalKey<ScaffoldState>();
  // appbar
  final drawer_icon = "assets/icon/paragraph.png";
  final profile = "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";

  // slider  indicator
  int currentPos = 0;

  //Timer
  static var countdownDuration1 = Duration(minutes: 10);
  Duration duration1 = Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;



  @override
  void initState() {
    var hours1;
    var mints1;
    var secs1;
    hours1 = int.parse("10");
    mints1 = int.parse("01");
    secs1 = int.parse("00");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }



  // slider image
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1643148636630-0b0fb138fc74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1643148636630-0b0fb138fc74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1643148636630-0b0fb138fc74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1643148636630-0b0fb138fc74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  ];


  // **********************  flash Screen  **************//

  final List<String> flash_image = [
    'https://m.media-amazon.com/images/I/610FqnGprqL._UX569_.jpg',
    'https://m.media-amazon.com/images/I/617EBtirK-L._UX569_.jpg',
    'https://m.media-amazon.com/images/I/617EBtirK-L._UX569_.jpg',
    'https://png.pngtree.com/png-clipart/20210801/original/pngtree-indian-women-saree-for-wedding-dress-png-image_6583106.jpg',
    'https://i.pinimg.com/474x/9a/6e/a7/9a6ea7a5b8c0754e7bb9b5c26b3f8b61.jpg',
  ];

  final List<String> name = [
    "Maxi Dress Fo",
    "Black Checke jhgjg",
    "jhgjgjgj gyuuyg",
    "hgGgggG ssh",
    "hjhg jhgh"
  ];

  final List<double> slider = [25, 60, 75, 100, 45];
  final List<int> available = [25, 60, 75, 100, 45];

  final List<String> per = ["20.2%", "12.1%", "15%", "50%", "35.6%"];

  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //



  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeManager>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Dark = isDark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark?Colors.black:Colors.black12,
      statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    ));

    return Scaffold(
      key: scaffoldkey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: getColorFromHex("#12e3ff"),
        foregroundColor: Colors.black,
        elevation: 0,

        splashColor: getColorFromHex(ColorCode.Color_sapphireblue),
        child: Container(
            height: 30,
            width: 30,
            child: Image.asset("assets/icon/home.png", color: Colors.black,)),
        onPressed: () {
          setState(() {});
        },
      ),
      drawer: navigationDrawer(),
      endDrawer: Right_navigationDrawer(),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
        title: Text(string.home, style: TextStyle(fontWeight: FontWeight.w700,
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
                                scaffoldkey.currentState?.openEndDrawer();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20,),


                  Stack(
                      children: [

                        CarouselSlider.builder(
                          itemCount: imgList.length,
                          options: CarouselOptions(
                              initialPage: 0,
                              height: 170,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayInterval: Duration(seconds: 5),
                              reverse: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentPos = index;
                                });
                              }
                          ),
                          itemBuilder: (context, i, id) {
                            //for onTap to redirect to another screen
                            return
                              Card(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  elevation: 1,
                                  child: GestureDetector(
                                    child: Container(


                                      //width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          imgList[i],
                                          fit: BoxFit.cover,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      var url = imgList[i];
                                      print(url.toString());
                                    },
                                  ));
                          },
                        ),


                        // slider indicator
                        Positioned(
                          right: 0,
                          bottom: 10,

                          child: Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(right: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: List<Widget>.generate(
                                    imgList.length, (int index) {
                                  return AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      height: 3,
                                      width: 20,
                                      //  width: (index == _currentPage)? 20:10,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      color: (currentPos == index)
                                          ?  isDark?Colors.white:getColorFromHex(
                                          ColorCode.Color_darkblue)
                                          : isDark?Colors.black54:getColorFromHex(
                                          ColorCode.Color_lightblue)
                                  );
                                }).toList(),
                              )
                          ),)
                      ]),

                  SizedBox(height: 30,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Container(
                        height: 25,
                        width: 25,
                        child: Image.asset("").AddImage(
                            "assets/icon/speaker.png", 0, 0,
                            isDark?Colors.white:getColorFromHex(
                                ColorCode.Color_sapphireblue)),),

                      Container(
                        child: Text(
                          string.flash_sales,
                          style: TextStyle(
                              color: isDark?Colors.white: getColorFromHex(ColorCode.Color_darkblue),
                              fontWeight: FontWeight.w900,fontSize: 22 )

                        ),

                      ),

                      const SizedBox(width: 20,),


                      Row(
                        children: [
                          Container(
                            child: Text(
                              "End in ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: isDark?Colors.white: getColorFromHex(
                                      ColorCode.Color_darkblue),
                                  fontWeight: FontWeight.normal
                              ),
                            ),

                          ),

                          //Timer
                          buildTime1(),
                        ],
                      ),

                    ],
                  ),

                  SizedBox(height: 20,),


                  Container(
                    height: 270,
                    child: GridView.builder(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount: flash_image.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery
                                .of(context)
                                .orientation ==
                                Orientation.landscape
                                ? 2
                                : 1,

                            mainAxisSpacing: 5,
                            childAspectRatio: 2 / 1.3),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {

                              },
                              child: Card(
                                //color: Colors.black12,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  elevation: 0,

                                  child: Stack(
                                    children: [
                                      Container(

                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(3.0),
                                          ),
                                          child: Image.network(
                                            flash_image[index],
                                            fit: BoxFit.fill,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            height: 155,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 7,
                                        child: Container(

                                          height: 28,
                                          child: Container(

                                            padding: EdgeInsets.only(
                                                left: 5, right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius: new BorderRadius
                                                    .circular(30.0),
                                                color: getColorFromHex(
                                                    ColorCode.Color_blue)),
                                            child: Center(
                                                child: Text(
                                                  per[index],
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      color: isDark?Colors.black: getColorFromHex(
                                                          ColorCode
                                                              .Color_White),
                                                      fontSize: 14),
                                                )),
                                          ),
                                        ),),

                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,

                                        child: Center(
                                          child: Container(
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(8.0),
                                              color:  isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color:  isDark?Colors.white24:Colors.black12,
                                                  blurRadius: 2.0,
                                                  spreadRadius: 3.0,
                                                  offset: Offset(0.0,
                                                      0.0), // shadow direction: bottom right
                                                )
                                              ],
                                            ),

                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Column(

                                                children: [
                                                  Container(
                                                    child: Text(
                                                      name[index],
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: isDark?Colors.white: getColorFromHex(
                                                              ColorCode
                                                                  .Color_darkblue),
                                                          fontWeight: FontWeight
                                                              .w500
                                                      ),
                                                    ),

                                                  ),
                                                  SizedBox(height: 5,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "130 Sales",
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:  isDark?Colors.white:getColorFromHex(
                                                                  ColorCode
                                                                      .Color_darkblue),
                                                              fontWeight: FontWeight
                                                                  .normal
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Container(
                                                        child: Image.asset(
                                                          "assets/icon/star.png",
                                                          color: Colors.amber,
                                                          height: 20,
                                                          width: 20,
                                                        ),),
                                                      Text(
                                                        "4.3",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:  isDark?Colors.white:getColorFromHex(
                                                              ColorCode
                                                                  .Color_darkblue),
                                                          fontWeight: FontWeight
                                                              .w900,
                                                        ),
                                                      ),

                                                    ],
                                                  ),

                                                  SizedBox(height: 15,),
                                                  Align(
                                                    alignment: Alignment
                                                        .bottomLeft,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 3),
                                                      child: Text(
                                                        available[index]
                                                            .toString() +
                                                            " Available",

                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:  isDark?Colors.white:getColorFromHex(
                                                                ColorCode
                                                                    .Color_darkblue),
                                                            fontWeight: FontWeight
                                                                .normal
                                                        ),
                                                      ),
                                                    ),
                                                  ),


                                                  Center(
                                                    child: SliderTheme(
                                                      child: Slider(
                                                        value: slider[index],
                                                        max: 100,

                                                        activeColor: (slider[index] >
                                                            30)
                                                            ? getColorFromHex(
                                                            ColorCode
                                                                .Color_blue)
                                                            : getColorFromHex(
                                                            ColorCode
                                                                .Color_red),
                                                        inactiveColor: getColorFromHex(
                                                            ColorCode
                                                                .Color_drawer_header),
                                                        onChanged: (
                                                            double value) {},
                                                      ),
                                                      data: SliderTheme.of(
                                                          context).copyWith(
                                                        trackHeight: 2,
                                                        overlayColor: Colors
                                                            .transparent,
                                                        // Custom Thumb overlay Color
                                                        thumbShape:
                                                        RoundSliderThumbShape(
                                                            enabledThumbRadius: 0.0),
                                                        overlayShape:
                                                        RoundSliderOverlayShape(
                                                            overlayRadius: 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )));
                        }),
                  ),

                  SizedBox(height: 35,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Container(
                        height: 25,
                        width: 25,
                        child: Image.asset("").AddImage(
                            "assets/icon/favorite.png", 0, 0,
                            isDark?Colors.white:getColorFromHex(
                                ColorCode.Color_sapphireblue)),),

                      Container(
                        child: Text(
                          string.recommended,
                          style: TextStyle(
                              fontSize: 22,
                              color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(height: 20,)
                    ],
                  ),


                  SizedBox(height: 20,),

                  Row(
                    children: [

                      Container(
                        decoration: BoxDecoration(
                            color: getColorFromHex(ColorCode.Color_blue,),
                            borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(30.0),
                              bottomRight: const Radius.circular(30.0),
                            )),
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(left: 15),
                            child: Image.asset(
                              "assets/icon/equalizer.png",
                              color: isDark?Colors.black:getColorFromHex(
                                  ColorCode.Color_White),
                              height: 25,
                              width: 25,
                            ),
                          ),
                          onTap: () {

                          },
                        ),
                      ),


                      Container(

                        decoration: BoxDecoration(
                            color: getColorFromHex(ColorCode.Color_blue,),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(25.0),
                              bottomLeft: const Radius.circular(25.0),
                            )),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            ]),
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),
                ]),
          )),

      // bottom Appbra
      bottomNavigationBar: BottomAppBar(
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
                    child: Image.asset("").AddImage(
                        "assets/icon/notification.png", 0, 0,
                        isDark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)),),
                  onTap: () {
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
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage(
                        "assets/icon/employee.png", 0, 0,
                        isDark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)),),
                  onTap: () {
                    setState(() {
                      Navigator.of(context).push(new PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 0),
                          pageBuilder: (BuildContext context, _, __) {
                            return new MyProfileScreen();
                          }));

                    });
                  },
                ),

                const SizedBox(width: 50,),


                InkWell(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage(
                        "assets/icon/chat.png", 0, 0,

                        isDark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)
                    ),),
                  onTap: () {
                    setState(() {


                      /* Navigator.of(context).push(new PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 0),
                          pageBuilder: (BuildContext context, _, __) {
                            return new NotificationScreen();
                          }));*/
                    });
                  },
                ),


                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage(
                        "assets/icon/heart.png", 0, 0,
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
                  },
                ),


              ],
            ),
          )
      ),
    );
  }

//Timer

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = Duration());
    }
  }

  void startTimer1() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime1());
  }

  void addTime1() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration1.inHours);
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [

      Text(
        hours + ":",
        style: TextStyle(
            fontSize: 15,
            color: Dark?Colors.white: getColorFromHex(ColorCode.Color_darkblue),
            fontWeight: FontWeight.normal
        ),
      ),
      Text(
        minutes + ":",
        style: TextStyle(
            fontSize: 15,
            color:  Dark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
            fontWeight: FontWeight.normal
        ),
      ),
      Text(
        seconds,
        style: TextStyle(
            fontSize: 15,
            color: Dark?Colors.white: getColorFromHex(ColorCode.Color_darkblue),
            fontWeight: FontWeight.normal
        ),
      ),
    ]);
  }


  ///  Recommended for you

}

