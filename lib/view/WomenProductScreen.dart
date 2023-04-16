import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/TabScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class WomenProductScreen extends StatefulWidget {
  @override
  WomenProductScreenState createState() => WomenProductScreenState();
}

class WomenProductScreenState extends State<WomenProductScreen>
    with SingleTickerProviderStateMixin {

  String list_colour = "#FFFFFF";

  late TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length:3, vsync: this);
    super.initState();
  }


  final drawer_icon = "assets/icon/return.png";
  final delete_icon = "assets/icon/delete.png";
  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
  var scaffoldkey = GlobalKey<ScaffoldState>();

  final List<String> name = [
    "All",
    "Sports",
    "Refurbished",
    "Royal",
    "cffs",
  ];

  final List<String> product_name = [
    "Digital Display Bracelete Watch ",
    "Spring Hand Grip Finger Strength",
    "Digital Display Bracelete Watch ",
    "Iphone wireless Bluetooth",
    "Digital Display Bracelete Watch "
  ];

  final List<String> images = [
    "https://img1.uhrcenter.de/images/produkte/auto/04507988689_2-269x269.jpg",
    "https://i.pinimg.com/736x/cf/51/8f/cf518fb43444a529f9c8eebef4c44c70--men-hats-fashion-styles.jpg",
    "https://media.istockphoto.com/photos/smart-watch-picture-id509464671?k=20&m=509464671&s=612x612&w=0&h=W1XeErzsTUwQeAws6VOiuZwgU5HIkU30j47jKTkTp64=",
    "https://media.istockphoto.com/photos/blank-promotional-wireless-earbuds-with-box-package-3d-render-picture-id1185463126?k=20&m=1185463126&s=612x612&w=0&h=eqSSS9PHNGpvYpD3V4ZDpyXcj8pFrVtOR4D-EJJu41w=",
    "https://media.istockphoto.com/photos/blank-promotional-wireless-earbuds-with-box-package-3d-render-picture-id1185463126?k=20&m=1185463126&s=612x612&w=0&h=eqSSS9PHNGpvYpD3V4ZDpyXcj8pFrVtOR4D-EJJu41w=",

  ];


  bool isSelected1 = true;
  bool isSelected2 = false;

  bool visibility = true;
  bool gridvisibility = false;




  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: getColorFromHex(ColorCode.Color_black),
      statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
    ));
    return Scaffold(
      drawer: navigationDrawer(),

      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(210.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://m.media-amazon.com/images/I/610FqnGprqL._UX569_.jpg',),
                  fit: BoxFit.cover
              )
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,

            elevation: 0,



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
                              "assets/icon/shopping_cart.png",color: getColorFromHex(ColorCode.Color_black),
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
                            5,right: 5,top: 2,bottom: 2
                            ),
                            decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                color: getColorFromHex(ColorCode.Color_blue)),
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

                child: Image.asset(drawer_icon, color: getColorFromHex(ColorCode.Color_black),),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),

            bottom: TabBar(
              controller: _tabController,
                unselectedLabelColor: getColorFromHex(ColorCode.Color_blue),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: getColorFromHex(ColorCode.Color_blue)),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: getColorFromHex(ColorCode.Color_blue), width: 0.8)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(string.product,style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: getColorFromHex(ColorCode.Color_blue), width: 0.8)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(string.detail,style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: getColorFromHex(ColorCode.Color_blue), width: 0.8)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(string.review,style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),
                ]),
          ),
                  ),
      ),
      body:  TabBarView(
          controller: _tabController,
          children: <Widget>[
            TabScreen( 'Sweater',),
            TabScreen( 'Jacket'),
            TabScreen( 'Socks'),

          ]  ),
    );
  }
}


