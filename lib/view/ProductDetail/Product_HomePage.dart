import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/repository/Extension/Extension.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';

class  Product_HomePage extends StatefulWidget {

     Product_HomePageState createState() =>    Product_HomePageState();
}

class    Product_HomePageState extends State<   Product_HomePage>{

  int currentPos = 0;
  String list_colour = "#FFFFFF";

  final profile = "https://images.unsplash.com/photo-1642775588061-5743b12a47c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";

  final List<String> product_name = [
    "Yosoo Knee pad Elasti",
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
    return  Scaffold(
      body:  Container(
        color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
        child: SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start ,
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[

                    SizedBox(width: 10,),

                    Container(

                      height: 25,
                      width: 25,
                      child: Image.asset("").AddImage(
                          "assets/icon/flag.png", 0, 0,
                          isDark?Colors.white:getColorFromHex(
                              ColorCode.Color_sapphireblue)),),


                      SizedBox(width: 25,),


                        Container(
                          child: Text(
                          string.huawei,
                            style: TextStyle(
                                fontSize: 20,
                                color:   isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ),]),
              ),

              const SizedBox(height: 20,),


              Stack(
                  children: [

                    CarouselSlider.builder(
                      itemCount: images.length,
                      options: CarouselOptions(
                          initialPage: 0,
                          height: 170,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayInterval: Duration(seconds: 5),
                          reverse: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }
                      ),
                      itemBuilder: (context, i, id) {
                        //for onTap to redirect to another screen
                        return
                          Card(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              elevation: 1,
                              child: GestureDetector(
                                child: Container(


                                  //width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      images[i],
                                      fit: BoxFit.cover,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  var url = images[i];
                                  print(url.toString());
                                },
                              ));
                      },
                    ),


                    // slider indicator
                    Positioned(
                      right: 0,
                      bottom: 10,

                      child: Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List<Widget>.generate(
                                images.length, (int index) {
                              return AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  height: 3,
                                  width: 20,
                                  //  width: (index == _currentPage)? 20:10,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  color: (currentPos == index)
                                      ?  isDark?Colors.white:getColorFromHex(
                                      ColorCode.Color_darkblue)
                                      : isDark?Colors.black54:getColorFromHex(
                                      ColorCode.Color_lightblue)
                              );
                            }).toList(),
                          )
                      ),)
                  ]),

              SizedBox(height: 15,),

              Container(
                color: isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[

                      SizedBox(width: 10,),

                      Container(

                        height: 25,
                        width: 25,
                        child: Image.asset("").AddImage(
                            "assets/icon/star_border.png", 0, 0,
                            isDark?Colors.white:getColorFromHex(
                                ColorCode.Color_sapphireblue)),),


                      SizedBox(width: 25,),


                      Container(
                        child: Text(
                          string.huawei,
                          style: TextStyle(
                              fontSize: 20,
                              color:   isDark?Colors.white:getColorFromHex(ColorCode.Color_darkblue),
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ),]),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
