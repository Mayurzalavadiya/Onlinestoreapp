import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';

class Appbarmenu extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbarmenu> {

  final drawer_icon = "assets/icon/paragraph.png";
  final profile = "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";


  var scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: getColorFromHex(ColorCode.Color_White),
      title: Text(string.home,style: TextStyle(  fontWeight: FontWeight.w700, color: getColorFromHex(ColorCode.Color_darkblue)),),
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
                        "assets/icon/shopping_cart.png",color: getColorFromHex(ColorCode.Color_darkblue),
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

          child: Image.asset(drawer_icon),
        ),
        onTap: (){
          scaffoldkey.currentState?.openDrawer();
        },
      ),
    );
  }
}
