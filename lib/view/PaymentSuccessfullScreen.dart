import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/MyOrderScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PaymentSuccessScreen extends StatefulWidget {
  @override
  PaymentSuccessScreenState createState() => PaymentSuccessScreenState();
}

class PaymentSuccessScreenState extends State<PaymentSuccessScreen>
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
          title: Text(string.checkout, style: TextStyle(fontWeight: FontWeight.w700,
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
              Center(
                child: Column(

                  children: [

                    SizedBox(height: 80,),

                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: getColorFromHex(ColorCode.Color_blue),
                          borderRadius: BorderRadius.circular((100.0),
                          ),
                        ),

                        child: Stack(
                          children: [
                            Positioned(
                              left:0,
                              top: 0,
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color:isDark?Colors.black12:Colors.white24,
                                  borderRadius: BorderRadius.only(
                                    topRight: const Radius.circular(0.0),
                                    topLeft: const Radius.circular(100.0),
                                    bottomRight: const Radius.circular(100.0),
                                    bottomLeft: const Radius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child:
                                  Image.asset(
                                    "assets/icon/done.png",color: isDark?Colors.black: getColorFromHex(ColorCode.Color_White),
                                    cacheHeight: 40,

                                  ),    ),
                            Positioned(
                              right:-0,
                              bottom: -0,
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: isDark?Colors.black12:Colors.white24,
                                  borderRadius: BorderRadius.only(
                                    topRight: const Radius.circular(0.0),
                                    topLeft: const Radius.circular(100.0),
                                    bottomRight: const Radius.circular(100.0),
                                    bottomLeft: const Radius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),),



                    SizedBox(height: 20,),

                    Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Text(
                      string.your_payment_successfully,
                          textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    SizedBox(height: 50,),

                    InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(30.0),
                              color: isDark?Colors.white24:Colors.black12),
                          child: Align(
                            alignment: Alignment.center,
                            child:  Text(
                            string.your_orders,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: getColorFromHex(ColorCode.Color_blue),
                                fontSize: 18),
                          ),),

                        ),
                        onTap: ()  {
                          Navigator.of(context).push(new PageRouteBuilder(
                              opaque: true,
                              transitionDuration: const Duration(milliseconds: 0),
                              pageBuilder: (BuildContext context, _, __) {
                                return new MyOrderScreen();
                              }));
                        })


                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
