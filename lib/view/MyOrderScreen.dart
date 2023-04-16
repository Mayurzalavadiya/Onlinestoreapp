import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyOrderScreen extends StatefulWidget {
  @override
  MyOrderScreenState createState() => MyOrderScreenState();
}

class MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {

  String list_colour = "#FFFFFF";


  final drawer_icon = "assets/icon/paragraph.png";
  final delete_icon = "assets/icon/delete.png";
  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
  var scaffoldkey = GlobalKey<ScaffoldState>();

  final List<String> name = [
    "All",
    "Unpaid",
    "Shipped",
    "To be Shipped",
    "in Dispute",
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
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      key: scaffoldkey,

      drawer: navigationDrawer(),
      backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
          title: Text(string.my_order, style: TextStyle(fontWeight: FontWeight.w700,
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
          child:
          Container(
            height: MediaQuery.of(context).size.height,
            color:  isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(ColorCode.Color_White),
        child: SingleChildScrollView(

              child: Column(

                children: [
                  Container(
                    height: 45,
                  child: ListView.builder(

    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemCount: name.length,
    itemBuilder: (BuildContext context, int index) {
    return
    InkWell(onTap: (){
setState(() {

});

    },
      child:Container(
       decoration: BoxDecoration(
                   color: isDark?getColorFromHex(ColorCode.Color_darkmode): getColorFromHex(list_colour),
                   border: Border.all(width: 1.5, color: getColorFromHex(ColorCode.Color_blue)),
                   borderRadius: BorderRadius.circular(20),
       ),
       padding: EdgeInsets.symmetric(horizontal: 20),
       margin: EdgeInsets.all(3),
    child: Center(
      child: Text(
      name[index],
      style: TextStyle(
      fontSize: 18,
      color: getColorFromHex(ColorCode.Color_blue),
      fontWeight: FontWeight.normal),
      ),
    ),
    ));
    }), ),
SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[


                         Container(

                          height: 25,
                          width: 25,
                          child: Image.asset("").AddImage(
                              "assets/icon/order.png", 0, 0,
                              isDark?Colors.white: getColorFromHex(
                                  ColorCode.Color_sapphireblue)),),




                         Container(
      child: Text(
      "Orders List",
      style: TextStyle(
                fontSize: 20,
                color: isDark?Colors.white: getColorFromHex(ColorCode.Color_darkblue),
                fontWeight: FontWeight.bold
      ),
    ),

                      ),

                      const SizedBox(width: 50,),


                      InkWell(
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset("").AddImage("assets/icon/list.png",0,0,
                              isSelected1
                                  ? getColorFromHex(
                                  ColorCode.Color_blue)
                                  : getColorFromHex(
                                  ColorCode.Color_drawer_header)),),
                        onTap: () {
                          setState(() {
                            isSelected1 = true;
                            isSelected2 = false;
                            visibility = true;
                            gridvisibility = false;

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

                          height: 20,
                          width: 20,
                          child: Image.asset("").AddImage("assets/icon/grid.png",0,0,
                              isSelected2
                                  ? getColorFromHex(
                                  ColorCode.Color_blue)
                                  : getColorFromHex(
                                  ColorCode.Color_drawer_header)),),

                        onTap: () {
                          setState(() {
                            isSelected1 = false;
                            isSelected2 = true;
                            visibility = false;
                            gridvisibility = true;

                          });
                        },
                      ),


                    ],
                  ),

                SizedBox(height: 15,),

                Stack(
                  children:[
                    Visibility(

                    visible: visibility,

                     child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: images.length,
                         physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (
                              BuildContext context,
                              int index,
                              ) {
                            return  Card(
                                  elevation: 0,
                                  margin: EdgeInsets.only(bottom: 8),
                                  color: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(list_colour),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

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


                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context).size.width/2.8,

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
                                                      color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue)))),

                                          SizedBox(height: 10,),

                                          Row(
                                            children: [

                                               Container(

                                                height: 18,
                                                width: 18,
                                                child: Image.asset("").AddImage("assets/icon/calendars.png",0,0,
                                                  getColorFromHex(
                                                        ColorCode.Color_menu_icon)
                                                )),
                                              SizedBox(width: 10,),
                                              Text(
                                                  "2019-8-09 20:09",
                                                  maxLines: 2,


                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .normal,
                                                      fontSize: 14,
                                                      color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                                            ],
                                          ),
                                          Row(
                                            children: [

                                               Container(

                                                height: 18,
                                                width: 18,
                                                child: Image.asset("").AddImage("assets/icon/chart.png",0,0,
                                                      getColorFromHex(
                                                        ColorCode.Color_menu_icon)
                                                        ),),
                                              SizedBox(width: 10,),

                                              Text(
                                                  "2019-8-09 20:09",
                                                  maxLines: 2,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .normal,
                                                      fontSize: 14,
                                                      color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 50,),

                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
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
                                                    color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue))),
                                            const SizedBox(height: 10,),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                              decoration: BoxDecoration(
                                                color: isDark?getColorFromHex(ColorCode.Color_darkmode):getColorFromHex(list_colour),
                                                border: Border.all(width:1.5,color: getColorFromHex(ColorCode.Color_menu_icon)),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                  "X 2",
                                                  maxLines: 2,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      fontSize: 15,
                                                      color:getColorFromHex(ColorCode.Color_menu_icon))),
                                            ),
                                          ],
                                        ),
                                      ) ,


                                          ],
                                  ),);}),

                  ),


                  Visibility(

                      visible: gridvisibility,
                     child:  Expanded(
                  child: Container(
                  //color: Colors.white,
                  child: GridView.builder(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                      physics: NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation ==
                      Orientation.landscape
                      ? 2
                      : 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: -0,
                  childAspectRatio: 50 / 80),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Card(
                      color: Colors.blue[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 0,
                      child: Column(
                        children: [
                          Container(

                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.0),
                              ),
                              child: Image.network(
                                images[index],
                                fit: BoxFit.fill,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 155,
                              ),
                            ),
                          ),



                             Center(
                              child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius
                                      .circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
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
                                              color: getColorFromHex(
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
                                                  color: getColorFromHex(
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
                                              color: getColorFromHex(
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
                product_name[index]
                                                .toString() +
                                                " Available",

                                            style: TextStyle(
                                                fontSize: 16,
                                                color: getColorFromHex(
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
                                            value: 20,
                                            max: 100,

                                            activeColor:  getColorFromHex(
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


                        ],
                      )),
                );
              }),
      ),
    ),
                  ),
          ]
        ),
                ],
              ),
            ),

        ))
    );
  }
}
