import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
class drawerHeader extends StatefulWidget {
  @override
  _drawerHeaderState createState() => _drawerHeaderState();
}

class _drawerHeaderState extends State<drawerHeader> {

  String profile = "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return DrawerHeader(
        decoration: BoxDecoration(
          color:  isDark?getColorFromHex(ColorCode.Color_Black_drawerheader):getColorFromHex(ColorCode.Color_drawer_header),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 70,
                  width: 70,
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

              Container(

margin: EdgeInsets.only(top: 10),

                child: Text(
                  "Andrew R. Whitesides",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: new TextStyle(
                    fontSize: 19.0,
                    fontFamily: 'FuturaBold',
                    color: getColorFromHex(ColorCode.Color_blue),
                  ),
                ),
              ),
              new Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2.3,
                margin: EdgeInsets.only(top: 6),
                child: Text(
                  "andrew@gmail.com",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: new TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: isDark?Colors.white: getColorFromHex(ColorCode.Color_sapphireblue),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
