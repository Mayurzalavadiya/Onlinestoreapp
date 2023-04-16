import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Wrap(
          children: [
            "Help Moviing",
            "Furniture Assembly",
            "Mounting",
            "Home Repairs",
            "Personal Assistant",
            "Delivery",
            "Hard Work",
            "Practice & Unpacking",
            "Painting",
            "Cleaning",
            "Heavy Liffing"
          ].map((f) => GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              margin: EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF282f61), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(
                    10.0) //                 <--- border radius here
                ),
              ),
              child: Text(f,
                style: TextStyle(
                  color: Color(0xFF17b01b),
                  fontSize: 16.0,
                ),
              ),
            ),
            onTap: () {},
          ))
              .toList(),
        ),
      ),
    );
  }
}