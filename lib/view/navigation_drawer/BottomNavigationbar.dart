import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/view/HomeScreen.dart';

import '../NotificationScreen.dart';

class BottomAppbar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomAppbar> {

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;


  @override
  Widget build(BuildContext context) {
    return   BottomAppBar(
    elevation: 1,
    shape: CircularNotchedRectangle(),
    color: Colors.white,
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
    isSelected2 = false;
    isSelected3 = false;
    isSelected4 = false;

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
          isSelected2
              ? getColorFromHex(
              ColorCode.Color_blue)
              : getColorFromHex(
              ColorCode.Color_sapphireblue)),),
      onTap: (){
        isSelected1 = false;
        isSelected2 = true;
        isSelected3 = false;
        isSelected4 = false;
      },
    ),

    const SizedBox(width: 50,),


    InkWell(
    child: Container(
    height: 25,
    width: 25,
    child: Image.asset("").AddImage("assets/icon/chat.png",0,0,
    isSelected3
    ? getColorFromHex(
    ColorCode.Color_blue)
        : getColorFromHex(
    ColorCode.Color_sapphireblue)),),
    onTap: (){
    setState(() {
    isSelected1 = false;
    isSelected2 = false;
    isSelected3 = true;
    isSelected4 = false;

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
    isSelected4
    ? getColorFromHex(
    ColorCode.Color_blue)
        : getColorFromHex(
    ColorCode.Color_sapphireblue)),),
    onTap: (){
    setState(() {
    isSelected1 = false;
    isSelected2 = false;
    isSelected3 = false;
    isSelected4 = true;
    });
    },
    ),


    ],
    ),
    )
    );
  }
}
