import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/getColor.dart';


extension ExtensionImage on Image {
  Container AddImage(String path, double Height, double Width, var ColorName) {
    return Container(
      child: Image.asset(
        path,
        height: Height,
        width: Width, color: ColorName ,
      ),
    );
  }
}

extension ExtensionIcon on Image {
  Container AddIcon(String path, double Height, double Width, double Margin) {
    return Container(
      margin: EdgeInsets.only(bottom: Margin),
      child: Image.asset(
        path,
        height: Height,
        width: Width,
      ),
    );
  }
}

extension ExtensionTextFormField on TextFormField {
  Container AddTextFormField(
      String Hint, String Family, var keyboardTypes, var move) {
    return Container(
      child: TextFormField(
        keyboardType: keyboardTypes,
        textInputAction: move,
        decoration: InputDecoration(
          hintText: Hint,
          hintStyle: TextStyle(
            color: getColorFromHex(ColorCode.Color_darkGray),
            fontSize: 15,
            fontFamily: Family,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

extension ExtensionTextFormFieldWithController on TextFormField {
  Container AddTextFormFieldWithController(String Hint, String Family,
      var keyboardTypes, var move, TextEditingController _controller) {
    return Container(
      child: TextFormField(
        controller: _controller,
        keyboardType: keyboardTypes,
        textInputAction: move,
        decoration: InputDecoration(
          hintText: Hint,
          hintStyle: TextStyle(
            color: getColorFromHex(ColorCode.Color_darkGray),
            fontSize: 15,
            fontFamily: Family,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

extension ExtensionButton on RaisedButton {
  Container addButton(String text) {
    return Container(
      child: RaisedButton(
        onPressed: () {},
        color: getColorFromHex(ColorCode.Color_blue),
        child: Text(
          text,
          style: TextStyle(
            color: getColorFromHex(ColorCode.Color_White),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

extension ExtensionText on Text {
  Container AddText(String family, string, double size, var ColorName) {
    return Container(
        child: Text(
      string,
      style: TextStyle(fontFamily: family, fontSize: size, color: ColorName),
    ));
  }
}

extension ExtensionTextMaxLine on Text {
  Container AddMaxLineText(
      String family, string, double size, var ColorName, var maxSize) {
    return Container(
        child: Text(
      string,
      maxLines: maxSize,
      style: TextStyle(fontFamily: family, fontSize: size, color: ColorName),
    ));
  }
}
