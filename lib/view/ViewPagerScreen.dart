import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/CommonScreen/Slider.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import 'package:onlinestoreapp/view/SignUpScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ViewPagerScreen extends StatefulWidget {
  @override
  ViewPagerScreenState createState() => ViewPagerScreenState();
}

class ViewPagerScreenState extends State<ViewPagerScreen> {


  bool visibility = true;
  int? _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPages(title: "Don't cry because it's over, smile because it happend.",
      image: "https://images.unsplash.com/photo-1642952867267-533b87bea300?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",),
    SliderPages(title: "Be yourself, everyone else is already taken.",
      image:  "https://images.unsplash.com/photo-1593455134585-6ea8ae38f6ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",),
    SliderPages(title: "Be yourself, everyone else is already taken.",
      image:  "https://images.unsplash.com/photo-1643005842873-3855db918670?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",),

    SliderPages(title: "Be yourself, everyone else is already taken.",
      image:  "https://images.unsplash.com/photo-1643005842873-3855db918670?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",),

  ];


_onChanged(int index){
  setState(() {
    _currentPage = index;
  });
}

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    ));
    return Scaffold(
        body:SafeArea(
          child: Stack(
            children: [

          Visibility(

            visible: visibility,

            child:
                 Align(
                   alignment: Alignment.topRight,
                   child: Container(
                     margin: EdgeInsets.all(20),
                     height: 35,
                     alignment: Alignment.center,
                     width: 90,
                     decoration:  BoxDecoration(
                         color:  getColorFromHex(ColorCode.Color_blue,),
                         borderRadius : BorderRadius.circular(25 ) ),
                     child:  InkWell(
                        onTap: (){
                          _controller.nextPage(duration:Duration(milliseconds: 500), curve: Curves.easeInOutQuint);

                          if((_currentPage == (_pages.length - 2))){
                            visibility = false;
                          }


                          },

                        child: (_currentPage == (_pages.length - 1)) ? Text("Skip", style: TextStyle(
                            color: getColorFromHex(ColorCode.Color_White, ),
                            fontSize: 16)): Text("Skip", style: TextStyle(
                            color: isDark?Colors.white:getColorFromHex(ColorCode.Color_White, ),
                            fontSize: 16))

                    ),
                ),
                 ),),

              Container(
                margin: EdgeInsets.only(top: 150),
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
            controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: _onChanged,
                  itemBuilder: (BuildContext context,int index,){
                    return _pages[index];
                  },),
              ),
              Column(

                  mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 80,left: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List<Widget>.generate(_pages.length, (int index){
                      return  AnimatedContainer(duration: Duration(milliseconds: 300),
                        height: 3,
                          width: 20,
                          //  width: (index == _currentPage)? 20:10,
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        color: (index == _currentPage)
                          ? isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue)
                                : isDark?Colors.white24:getColorFromHex(ColorCode.Color_lightblue)
                      );})),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                              (route) => false);
                    },
                  child: Container(
                    alignment: Alignment.centerLeft,

                    height: 50,
                    width: MediaQuery.of(context).size.width/1.3,
                    decoration:  BoxDecoration(
                        color:  getColorFromHex(ColorCode.Color_blue,),
                        borderRadius : BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          bottomLeft: const Radius.circular(25.0),
                        ) ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Text(string.signup, style: TextStyle(
                                color: isDark?Colors.black:getColorFromHex(ColorCode.Color_White, ),
                                fontSize: 20)),
                        Icon(Icons.arrow_forward_outlined, color: isDark?Colors.black:getColorFromHex(ColorCode.Color_White),)
                        
                        
                      ]  ),
                    )
                

        ),


              ),
              SizedBox(height: 50,)])
            ],
          ),
        ));
  }




}
