import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/PaymentSuccessfullScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  CheckoutScreenState createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen>
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
                              string.payment_mode,
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
                              string.select_your_payment_mode,
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

                  SizedBox(height: 50,),

              Container(
                height:15,
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                  color:  isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  isDark?Colors.white24:Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0,
                          2.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
                  Container(
                height:15,
                width: MediaQuery.of(context).size.width/1.35,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                    ),
                  color:  isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  isDark?Colors.white24:Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                        offset: Offset(0.0,
                            2.0) // shadow direction: bottom right
                    )
                  ],
                ),
              ),

                  Container(
                height:200,
                width: MediaQuery.of(context).size.width/1.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius
                      .circular(10.0),
                  color:  isDark?Colors.black54:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  isDark?Colors.white24:Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                      offset: Offset(0.0,
                          2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Align(
                          alignment: Alignment.topLeft,
                         child:  Image.asset(
                              "assets/image/visa.png",
                              height: 60,
                              width: 60,

                            ),),

                        Container(
                          child: Text(
                            string.card_number,
                            style: TextStyle(
                                fontSize: 15,
                                color: isDark?Colors.white54:getColorFromHex(ColorCode.Color_menu_icon),
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        Container(
                          child: Text(
                            "8154  3265  0045  1582",
                            style: TextStyle(
                                fontSize: 18,
                                color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                fontWeight: FontWeight.w900
                            ),
                          ),
                        ),
                          SizedBox(height: 25,),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Container(
                                    child: Text(
                                      string.expiry_date,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: isDark?Colors.white54:getColorFromHex(ColorCode.Color_menu_icon),
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 5,),
                                  Container(
                                    child: Text(
                                      "07/21",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ],),),

                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Container(
                                    child: Text(
                                      string.cvv,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: isDark?Colors.white54:getColorFromHex(ColorCode.Color_menu_icon),
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 5,),
                                  Container(
                                    child: Text(
                                      "007",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ],),)

                          ],)
                      ],),
                    ),
              ),

                  SizedBox(height: 40,),

                  Container(
                    child: Text(
                      string.or_checkout_with,
                      style: TextStyle(
                          fontSize: 15,
                          color: isDark?Colors.white60:getColorFromHex(ColorCode.Color_menu_icon),
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),

                  SizedBox(height: 40,),


                     InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(30.0),
                              color: isDark?Colors.white24:Colors.black12),
                          child: Align(
                            alignment: Alignment.center,
                            child:  Image.asset(
                              "assets/image/paypal.png",
                            ),),

                        ),
                        onTap: ()  {
                          Navigator.of(context).push(new PageRouteBuilder(
                              opaque: true,
                              transitionDuration: const Duration(milliseconds: 0),
                              pageBuilder: (BuildContext context, _, __) {
                                return new CheckoutScreen();
                              }));
                        }),


                  SizedBox(height: 20,),


                     InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(30.0),
                              color: isDark?Colors.white24:Colors.black12),
                          child: Align(
                            alignment: Alignment.center,
                            child:  Image.asset(
                              "assets/image/apple_pay.png",
                              height: 80,
                              width: 80,
                            ),),

                        ),
                        onTap: ()  {
                          Navigator.of(context).push(new PageRouteBuilder(
                              opaque: true,
                              transitionDuration: const Duration(milliseconds: 0),
                              pageBuilder: (BuildContext context, _, __) {
                                return new CheckoutScreen();
                              }));
                        }),


                  SizedBox(height: 20,),
                  Container(

                    width: MediaQuery.of(context).size.width/1.2,
                    height: 50,
                    child: InkWell(
                        child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(30.0),
                              color: getColorFromHex(ColorCode.Color_blue)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                string.confirm_payment,
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
                                return new PaymentSuccessScreen();
                              }));
                        }),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
