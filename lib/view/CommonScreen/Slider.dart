import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';

class SliderPages extends StatelessWidget{
 String? title;
 String? image;

 SliderPages({this.title,this.image});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Container(
             height: 260,
             width: MediaQuery.of(context).size.width,
             child: Image(image:NetworkImage(image!))),
          SizedBox(height: 50,),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 100),
                width: MediaQuery.of(context).size.width/1.5,

                child: Text(title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue,),),),
              ))

      ],)
    );
  }

}