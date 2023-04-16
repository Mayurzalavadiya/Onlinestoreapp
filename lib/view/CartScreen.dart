import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/ChechoutScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {

  String list_colour = "#FFFFFF";


  final drawer_icon = "assets/icon/return.png";
  final delete_icon = "assets/icon/delete.png";
  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";


  final List<String> product_name = [
    "Plant Vases ",
    "Maxi Dress  For Women Summer",
    "Fodable Silicone Colander Fruite jhggxcxcscfshjgj",
    "Iphone wireless Bluetooth",

    "Alarm Waterproof  Sport Army "
  ];

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        //key: scaffoldkey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
          title: Text(string.cart, style: TextStyle(fontWeight: FontWeight.w700,
              color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)),),
          titleSpacing: 30,
          actions: <Widget>[
            Center(

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
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
            child:

            Container(
              height: MediaQuery.of(context).size.height,
              color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
              child: SingleChildScrollView(
                child:
                Column(

                  children: [

                    SizedBox(height: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        SizedBox(width: 20,),
                        Container(

                          height: 25,
                          width: 25,
                          child: Image.asset("").AddImage(
                              "assets/icon/shopping_cart.png", 0, 0,
                              isDark?Colors.white:getColorFromHex(
                                  ColorCode.Color_sapphireblue)),),
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                string.shopping_cart,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: Text(
                                 "Verify your quantity and click checkout",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue),
                                    fontWeight: FontWeight.normal
                                ),
                              ),

                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),

                      Container(
                        color: Colors.black12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: images.length,
                              itemBuilder: (
                                  BuildContext context,
                                  int index,
                                  ) {
                                return  Card(
                                  elevation: 0,
                                  margin: EdgeInsets.only(bottom: 15),
                                  color: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(list_colour),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      const SizedBox(width: 20,),
                                      Center(
                                        child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 8),
                                            height: 80,
                                            width: 75,
                                            child: profile != null
                                                ? ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  images[index]!,
                                                  fit: BoxFit.fill,
                                                ))
                                                : ClipRRect(
                                                borderRadius: BorderRadius.circular(50.0),
                                                child: Image.asset("assets/image/blank.webp"))),
                                      ),

                                      const SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context).size.width/2.2,

                                              child: Text(
                                                  product_name[index],
                                                  maxLines: 2,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize: 18,
                                                      color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue)))),

                                          SizedBox(height: 10,),

                                             Text(
                                              "89.56",
                                              maxLines: 2,
                                              overflow: TextOverflow
                                                  .ellipsis,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontSize: 20,
                                                  color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                                        ],
                                      ),
                                      const SizedBox(width: 20,),

                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(height: 10,),
                                            InkWell(
                                              onTap: () {
                                                _incrementCounter();
                                              },
                                              child: Container(
                                             child: Image.asset(
                                                "assets/icon/plus.png",color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue),
                                                cacheHeight: 25,
                                              ),
                                            ),),
                                            const SizedBox(height: 10,),
                                        Text(
                                            '$_counter',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight
                                                    .bold,
                                                fontSize: 16,
                                                color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                                            const SizedBox(height: 10,),

                                        InkWell(
                                            onTap: () {
                                              _decrementCounter();
                                            },
                                            child:Container(
                                         child: Image.asset(
                                            "assets/icon/minus.png",color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue),
                                            cacheHeight: 25,
                                          ),),
                                        ) ,
                                            const SizedBox(height: 10,),

                                          ],
                                        ),
                                      ) ,

                                    ],
                                  ),);}),


                Container(
                  padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                                          ),
                    color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                    boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2.0,
                          spreadRadius: 3.0,
                          offset: new Offset(0.0, 1.5), // shadow direction: bottom right
                        )]),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                              "subtotal",
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight
                                      .w500,
                                  fontSize: 20,
                                  color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                          Text(
                              "50.23",
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight
                                      .normal,
                                  fontSize: 20,
                                  color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),

                    ],),
SizedBox(height: 5,),
                    Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                              "TAX (20%)",
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  fontSize: 16,
                                  color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                          Text(
                              "13.23",
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis,
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight
                                      .normal,
                                  fontSize: 20,
                                  color:isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),

                    ],),
                    SizedBox(height: 10,),
                    Container(

                        width: MediaQuery.of(context).size.width/1.1,
                        height: 45,
                        child: InkWell(
                            child: Container(
                               padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  color: getColorFromHex(ColorCode.Color_blue)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 10,),
                                       Text(
                                        string.checkout,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: isDark?Colors.black:getColorFromHex(ColorCode.Color_White),
                                            fontSize: 16),
                                      ),
                                  SizedBox(width: 50,),
                                  Text(
                                    "55.36",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isDark?Colors.black:getColorFromHex(ColorCode.Color_White),
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            onTap: ()  {
                              Navigator.of(context).push(new PageRouteBuilder(
                                  opaque: true,
                                  transitionDuration: const Duration(milliseconds: 0),
                                  pageBuilder: (BuildContext context, _, __) {
                                    return new CheckoutScreen();
                                  }));
                            }),
                    ),
                  ],)
                )
                  ]),
                      )

                  ],
                ),
                ),
            ),
       )
    );
  }
}
