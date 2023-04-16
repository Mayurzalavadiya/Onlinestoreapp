import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CartScreen.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';
import 'package:onlinestoreapp/view/MyWishlistScreen.dart';
import 'package:onlinestoreapp/view/NotificationScreen.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import 'package:onlinestoreapp/view/SignUpScreen.dart';
import 'package:onlinestoreapp/view/navigation_drawer/BottomNavigationbar.dart';
import 'package:onlinestoreapp/view/navigation_drawer/drawerHeader.dart';
import 'package:onlinestoreapp/view/navigation_drawer/navigationDrawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen>
    with SingleTickerProviderStateMixin {

  bool  Dark = false;

  String list_colour = "#eaeae6";

  bool isSelected1 = true;

  final drawer_icon = "assets/icon/paragraph.png";
  final delete_icon = "assets/icon/delete.png";
  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";
  var scaffoldkey = GlobalKey<ScaffoldState>();


  final List<String> name = [
    "Sh", "Sweater", "Jacket", "Socks", "Trousers", "Shirt","Sweater", "Jacket", "Socks", "Trousers"
  ];

       // Dialog
  String? valuechoose;
  List listitem = ["Male", "Female",];

  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Dark = isDark;
    return Scaffold(
      key: scaffoldkey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: getColorFromHex("#12e3ff"),
        foregroundColor: Colors.black,
        elevation: 3,

        splashColor: getColorFromHex(ColorCode.Color_sapphireblue),
        child: Container(
            height: 30,
            width: 30,
            child: Image.asset("assets/icon/home.png", color: Colors.black,)),
        onPressed: () {
          setState(() {});
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
        title: Text(string.account, style: TextStyle(fontWeight: FontWeight.w700,
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

                    const SizedBox(height: 20,),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Container(
                            child: Text(
                              "Andrew R. WhiteSides",
                              style: new TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                              ),
                            ),
                          ),
                          new Container(
                            child: Text(
                              "andrew@gmail.com",
                              style: new TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                              ),
                            ),
                          ),
                        ]),
                          const SizedBox(height: 20,),
                          Container(
                              height: 60,
                              width: 60,
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
                      ],),
                    ),

                    const SizedBox(height: 20,),
                    Container(
                     width: MediaQuery.of(context).size.width/1.1,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:  isDark?Colors.white24:Colors.black12.withOpacity(0.3),
                              spreadRadius: 1 ,
                              blurRadius: 5,)
                          ]),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Column(
                          children: [
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  "assets/icon/heart.png",
                                  color: isDark?Colors.white:getColorFromHex(
                                      ColorCode.Color_black),
                                  height: 25,
                                  width: 25,
                                ),),
                              onTap: () {

                              },
                            ),

                            Container(
                              child: Text(
                                string.favorite,
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  "assets/icon/star_border.png",
                                  color: isDark?Colors.white:getColorFromHex(
                                      ColorCode.Color_black),
                                  height: 25,
                                  width: 25,
                                ),),
                              onTap: () {

                              },
                            ),
                            Container(
                              child: Text(
                                string.following,
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              child: Container(
                                child: Image.asset(
                                  "assets/icon/chat.png",
                                  color: isDark?Colors.white:getColorFromHex(
                                      ColorCode.Color_black),
                                  height: 25,
                                  width: 25,
                                ),),
                              onTap: () {

                              },
                            ),      Container(
                              child: Text(
                                string.message,
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],)  ),

                    const SizedBox(height: 20,),
                    Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:  isDark?Colors.white24:Colors.black12.withOpacity(0.3),
                                spreadRadius: 1 ,
                                blurRadius: 5,)]),
                        child:    Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[


                                Row(

                                  children: [
                                    SizedBox(width: 20,),
                                    Container(

                                      height: 25,
                                      width: 25,
                                      child: Image.asset("").AddImage(
                                          "assets/icon/order.png", 0, 0,
                                          isDark?Colors.white:getColorFromHex(
                                              ColorCode.Color_black)),),


                                SizedBox(width: 25,),
                                Container(
                                  child: Text(
                                    "Orders List",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                ),
                                  ],
                                ),


                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                      string.view_all,
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                    ),),
                                ),

                              ],
                            ),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.unpaid,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                            Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                      margin: EdgeInsets.only(
                         right: 5.0,),
                      decoration: BoxDecoration(
                        border: Border.all(width:1.5,color: getColorFromHex(ColorCode.Color_menu_icon)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("1",
                        style: TextStyle(
                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                            ],),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.to_be_shioped,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                            Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                      margin: EdgeInsets.only(
                         right: 5.0,),
                      decoration: BoxDecoration(
                        border: Border.all(width:1.5,color: getColorFromHex(ColorCode.Color_menu_icon)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("5",
                        style: TextStyle(
                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                            ],),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.shioped,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                            Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                      margin: EdgeInsets.only(
                         right: 5.0,),
                      decoration: BoxDecoration(
                        border: Border.all(width:1.5,color: getColorFromHex(ColorCode.Color_menu_icon)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("3",
                        style: TextStyle(
                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_sapphireblue),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                            ],),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.in_dispute,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color:isDark?Colors.white: getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                           /* Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                      margin: EdgeInsets.only(
                         right: 5.0,),
                      decoration: BoxDecoration(
                        border: Border.all(color: getColorFromHex(ColorCode.Color_menu_icon)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("2",
                        style: TextStyle(
                          color: getColorFromHex(ColorCode.Color_sapphireblue),
                          fontSize: 16.0,
                        ),
                      ),
                    ),*/
                            ],),
                          ],
                        ), ),


                    const SizedBox(height: 20,),
                    Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:  isDark?Colors.white24:Colors.black12.withOpacity(0.3),
                                spreadRadius: 1 ,
                                blurRadius: 5,)]),
                        child:    Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[


                                Row(

                                  children: [
                                    SizedBox(width: 20,),
                                    Container(

                                      height: 25,
                                      width: 25,
                                      child: Image.asset("").AddImage(
                                          "assets/icon/employee.png", 0, 0,
                                          isDark?Colors.white:getColorFromHex(
                                              ColorCode.Color_black)),),


                                SizedBox(width: 25,),
                                Container(
                                  child: Text(
                                    string.profile_settings,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                ),
                                  ],
                                ),


                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        string.edit,
                                        style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                          color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                      ),),
                                  ),
                                  onTap: (){
                                    showDialog(context: context, builder: (BuildContext context)
                                    {
                                      return AlertDialog(
                                        title: Row(
                                          children: [
                                            Container(

                                              height: 25,
                                              width: 25,
                                              child: Image.asset("").AddImage(
                                                  "assets/icon/employee.png", 0,
                                                  0,
                                                  getColorFromHex(
                                                      ColorCode.Color_black)),),


                                            SizedBox(width: 10,),
                                            Text(
                                              string.profile_settings,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        titleTextStyle: TextStyle(
                                          fontSize: 18.0,
                                          color: getColorFromHex(
                                              ColorCode.Color_darkblue),
                                          fontWeight: FontWeight.w800,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Save',style: TextStyle(color:getColorFromHex(ColorCode.Color_blue)),),
                                          ),
                                        ],
                                        content: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .stretch,
                                            children: <Widget>[
                                              TextField(
                                                style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500,color: getColorFromHex(ColorCode.Color_darkblue)),
                                                //  focusNode: _nodePhone,
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                  labelText: string.full_name,
                                                    labelStyle: TextStyle(fontWeight: FontWeight.normal,
                                                      color: getColorFromHex(ColorCode.Color_darkblue),
                                                    )),
                                                textInputAction: TextInputAction
                                                    .next,
                                                onEditingComplete: () {
                                                  //     FocusScope.of(context).requestFocus(_nodeEmail);
                                                },
                                              ),
                                              TextField(
                                                style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500,color: getColorFromHex(ColorCode.Color_darkblue)),
                                                // focusNode: _nodeEmail,
                                                keyboardType: TextInputType
                                                    .emailAddress,
                                                decoration: InputDecoration(
                                                  labelText: string.email_address,
                                                    labelStyle: TextStyle(fontWeight: FontWeight.normal,
                                                        color: getColorFromHex(ColorCode.Color_darkblue),
                                                       )),

                                                textInputAction: TextInputAction
                                                    .next,
                                                onEditingComplete: () {
                                                  //     FocusScope.of(context).requestFocus(_nodeFullname);
                                                },
                                              ),

                                        DropdownButton(
                                          hint: Text('Please choose a location'), // Not necessary for Option 1
                                          value: valuechoose,
                                          onChanged: (newValue) {
                                            setState(() {
                                              valuechoose = newValue.toString();
                                            });
                                          },
                                          items: listitem.map((location) {
                                            return DropdownMenuItem(
                                              child: new Text(location),
                                              value: location,
                                            );
                                          }).toList()),

                                             TextField(
                                               style: TextStyle( fontSize: 18, fontWeight: FontWeight.w500,color: getColorFromHex(ColorCode.Color_darkblue)),
                                               controller: dateinput, //editing controller of this TextField
                                               decoration: InputDecoration(
                                                   labelText: string.birth_date, //label text of field
                                                   labelStyle: TextStyle( fontWeight: FontWeight.normal,
                                                     color: getColorFromHex(ColorCode.Color_darkblue),
                                             )),
                                               readOnly: true,  //set it true, so that user will not able to edit text
                                               onTap: () async {
                                                 DateTime? pickedDate = await showDatePicker(
                                                     context: context,
                                                     initialDate: DateTime.now(),
                                                     firstDate: DateTime(1901,1), //DateTime.now() - not to allow to choose before today.
                                                     lastDate: DateTime(2101)
                                                          );

                                                 if(pickedDate != null ){
                                                   print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                                   String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                   print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                                            //you can implement different kind of Date Format here according to your requirement

                                                   setState(() {
                                                     dateinput.text = formattedDate; //set output date to TextField value.
                                                   });
                                                 }else{
                                                            print("Date is not selected");
                                                          }
                                                        },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                ),

                              ],
                            ),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.full_name,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Andrew R. Whitesides",
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: getColorFromHex(ColorCode.Color_menu_icon),

                                    ),),
                                ),
                            ],),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.email,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "andrew@gmail.com",
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: getColorFromHex(ColorCode.Color_menu_icon),

                                    ),),
                                ),
                            ],),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.gender,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Male",
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: getColorFromHex(ColorCode.Color_menu_icon),

                                    ),),
                                ),
                            ],),

                            SizedBox(height: 15,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  string.birth_date,
                                  style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),

                                  ),),
                              ),

                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "1993-12-31",
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: getColorFromHex(ColorCode.Color_menu_icon),

                                    ),),
                                ),
                            ],),
                          ],
                        ),
                    ),

                    const SizedBox(height: 20,),
                    Container(
                        width: MediaQuery.of(context).size.width/1.1,
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color:  isDark?Colors.white24:Colors.black12.withOpacity(0.3),
                                spreadRadius: 1 ,
                                blurRadius: 5,)]),
                        child:    Column(
                          children: [
                                Row(

                                  children: [
                                    SizedBox(width: 20,),
                                    Container(

                                      height: 25,
                                      width: 25,
                                      child: Image.asset("").AddImage(
                                          "assets/icon/settings.png", 0, 0,
                                          isDark?Colors.white:getColorFromHex(
                                              ColorCode.Color_black)),),


                                SizedBox(width: 25,),
                                Container(
                                  child: Text(
                                    string.account_settings,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),

                                ),
                                  ],
                                ),


                            SizedBox(height: 15,),



                                Row(

                                  children: [
                                    SizedBox(width: 20,),
                                    Container(

                                      height: 23,
                                      width: 23,
                                      child: Image.asset("").AddImage(
                                          "assets/icon/map.png", 0, 0,
                                          isDark?Colors.white:getColorFromHex(
                                              ColorCode.Color_menu_icon)),),


                                    SizedBox(width: 25,),
                                    Container(
                                      child: Text(
                                        string.shioped_address,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),

                                    ),
                                  ],
                                ),




                            SizedBox(height: 15,),

                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[


                                Row(

                                  children: [
                                    SizedBox(width: 20,),
                                    Container(

                                      height: 23,
                                      width: 23,
                                      child: Image.asset("").AddImage(
                                          "assets/icon/language.png", 0, 0,
                                          isDark?Colors.white:getColorFromHex(
                                              ColorCode.Color_menu_icon)),),


                                    SizedBox(width: 25,),
                                    Container(
                                      child: Text(
                                        string.languages,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),

                                    ),
                                  ],
                                ),


                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    string.english,
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                      color: getColorFromHex(ColorCode.Color_menu_icon),

                                    ),),
                                ),

                              ],
                            ),

                            SizedBox(height: 15,),



                                Row(

                                  children: [
                                    SizedBox(width: 20,),
                                    Container(

                                      height: 25,
                                      width: 25,
                                      child: Image.asset("").AddImage(
                                          "assets/icon/info.png", 0, 0,
                                          isDark?Colors.white:getColorFromHex(
                                              ColorCode.Color_menu_icon)),),


                                    SizedBox(width: 25,),
                                    Container(
                                      child: Text(
                                        string.help_support,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:  isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),

                                    ),
                                  ],
                                ),



                          ],
                        ),
                    ),



                    SizedBox(height: 30,)
                  ]),
            ),
          )),

      // bottom Appbra
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          shape: CircularNotchedRectangle(),
          color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
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
                        Dark?Colors.white:getColorFromHex(
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
                    child: Image.asset("").AddImage("assets/icon/employee.png",0,0,
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
                const SizedBox(width: 50,),


                InkWell(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset("").AddImage(
                        "assets/icon/chat.png", 0, 0,
                        Dark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)),),
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
                        Dark?Colors.white:getColorFromHex(
                            ColorCode.Color_sapphireblue)),),
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
}
