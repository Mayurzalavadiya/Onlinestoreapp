import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ColorCode.dart';
import 'getColor.dart';

class CommonWidget {
  static Future<void> getToast(String msg) async {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        backgroundColor: getColorFromHex(ColorCode.Color_darkGray),
        textColor: getColorFromHex(ColorCode.Color_White),
        fontSize: 16.0);
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(key: key,
                  //backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(
                          color: getColorFromHex(ColorCode.Color_blue),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(
                              color: getColorFromHex(ColorCode.Color_blue)),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
