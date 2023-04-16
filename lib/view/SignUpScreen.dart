import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinestoreapp/utils/ColorCode.dart';
import 'package:onlinestoreapp/utils/CommonWidget.dart';
import 'package:onlinestoreapp/utils/getColor.dart';
import 'package:onlinestoreapp/utils/string.dart';
import 'package:onlinestoreapp/view/SignInScreen.dart';
import "package:page_transition/page_transition.dart";

class SignUpScreen extends StatefulWidget{
  @override
  _SignUpScreen createState() => _SignUpScreen();

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }
  bool validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{4,}$';

    RegExp regex = new RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }
}

class _SignUpScreen  extends State<SignUpScreen>{

  final facebook = "assets/image/facebook.png";
  final twitter = "assets/image/twitter.png";
  final google = "assets/image/google_plus.png";
  final linkedin = "assets/image/linkedin.png";

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirm_password = new TextEditingController();

  bool _autoValidate = true;

 bool _passwordVisible = false;
 bool _confirm_passwordVisible = false;


  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: getColorFromHex(ColorCode.Color_blue),
      body:SafeArea(
      child:Stack(
      children : [
      Container(
      child: SingleChildScrollView(
      child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: 60, ),
            height:20,

            width: MediaQuery.of(context).size.width/1.5,

            decoration:
            BoxDecoration(

                color: isDark?Colors.black26:Colors.white60,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                )
            ),
          ),),

       Align(
        alignment: Alignment.center,
         child:    Container(

                  height: 490,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration:
                  BoxDecoration(
                    color:  isDark?getColorFromHex(ColorCode.Color_darkmode):Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                  ),
                ),
           child:Column(children: [
             const SizedBox(height: 50),
             Container(
                     child: Text(string.signup,
                         style: TextStyle(
                             fontSize: 23, fontWeight: FontWeight.bold,
                             color: getColorFromHex(
                                 ColorCode.Color_blue)))),

             const SizedBox(height: 30),

             Container(
               decoration: BoxDecoration(
                 
               ),
               width: MediaQuery.of(context).size.width,
               margin: const EdgeInsets.symmetric( horizontal: 25   ),
               child: Center(
                 child: TextFormField(
                   controller: _email,
                   keyboardType: TextInputType.emailAddress,
                   textInputAction: TextInputAction.next,
                   cursorColor:getColorFromHex(ColorCode.Color_blue) ,
                   //maxLength: 10,
                   decoration: InputDecoration(
                     hintText: string.email_address,
                     hintStyle: TextStyle(color:  isDark?getColorFromHex(ColorCode.Color_blue):Colors.grey),
                     prefixIcon: Icon(Icons.email_outlined, color: getColorFromHex(ColorCode.Color_blue),),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: getColorFromHex(ColorCode.Color_blue))),
                     enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: getColorFromHex(ColorCode.Color_lightblue) ),
                     ),
                     // border: InputBorder.none,
                     //helperText: string.Mobile,
                    // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                   ),
                 ),
               ),
             ),

             const SizedBox(height: 15),
             Container(

               width: MediaQuery.of(context).size.width,
               margin: const EdgeInsets.symmetric( horizontal: 25   ),

               child: TextFormField(
                 keyboardType: TextInputType.visiblePassword,
                 controller: _password,
                 textInputAction: TextInputAction.next,
                 obscureText: !_passwordVisible,//This will obscure text dynamically
                 decoration: InputDecoration(
                   hintText: string.password,
                   hintStyle: TextStyle(color:  isDark?getColorFromHex(ColorCode.Color_blue):Colors.grey),
                     prefixIcon: Icon(Icons.lock_outline, color: getColorFromHex(ColorCode.Color_blue),),
                     focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: getColorFromHex(ColorCode.Color_blue))),
                     enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: getColorFromHex(ColorCode.Color_lightblue) ),
                     ),

                   // Here is key idea
                   suffixIcon: IconButton(
                     icon: Icon(
                       // Based on passwordVisible state choose the icon
                       _passwordVisible
                           ? Icons.visibility
                           : Icons.visibility_off,
                       color: getColorFromHex(ColorCode.Color_blue) ,
                     ),
                     onPressed: () {
                       // Update the state i.e. toogle the state of passwordVisible variable
                       setState(() {
                         _passwordVisible = !_passwordVisible;
                       });
                     },
                   ),
                 ),
               ),

             ),
             const SizedBox(height: 15),
             Container(
               width: MediaQuery.of(context).size.width,
               margin: const EdgeInsets.symmetric( horizontal: 25   ),

               child: TextFormField(
                 keyboardType: TextInputType.visiblePassword,
                 controller: _confirm_password,
                 textInputAction: TextInputAction.done,
                 obscureText: !_confirm_passwordVisible,//This will obscure text dynamically
                 decoration: InputDecoration(
                   hintText: string.confirm_password,
                   hintStyle: TextStyle(color:  isDark?getColorFromHex(ColorCode.Color_blue):Colors.grey),
                     prefixIcon: Icon(Icons.lock_outline, color: getColorFromHex(ColorCode.Color_blue),),
                     focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: getColorFromHex(ColorCode.Color_blue))),
                     enabledBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: getColorFromHex(ColorCode.Color_lightblue) ),
                     ),

                   // Here is key idea
                   suffixIcon: IconButton(
                     icon: Icon(
                       // Based on passwordVisible state choose the icon
                       _confirm_passwordVisible
                           ? Icons.visibility
                           : Icons.visibility_off,
                       color: getColorFromHex(ColorCode.Color_blue) ,
                     ),
                     onPressed: () {
                       // Update the state i.e. toogle the state of passwordVisible variable
                       setState(() {
                         _confirm_passwordVisible = !_confirm_passwordVisible;
                       });
                     },
                   ),
                 ),
               ),

             ),

             const SizedBox(height: 40),

             Container(

               width: 160,
               height: 45,
               child: InkWell(
                   child: Container(
                     // padding: EdgeInsets.only(left: 20, right: 20),
                     decoration: BoxDecoration(
                         borderRadius: new BorderRadius.circular(30.0),
                         color: getColorFromHex(ColorCode.Color_blue)),
                     child: Center(
                         child: Text(
                           string.signup,
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                               color: getColorFromHex(ColorCode.Color_White),
                               fontSize: 15),
                         )),
                   ),
                   onTap: () async {
                     if (_email.text.trim().isEmpty) {
                       CommonWidget.getToast(string.enter_email);
                       return;
                     } else if(!widget
                         .validateEmail(_email.text.trim())){
                       CommonWidget.getToast(string.enter_valid_email);
                       return;
                     } else if (_password.text.trim().isEmpty) {
                       CommonWidget.getToast(string.enter_password);
                       return;
                     }else if(!widget
                         .validatePassword(_password.text.trim())){
                       CommonWidget.getToast(string.enter_strong_password);
                       return;
                     } else if (_confirm_password.text.trim().isEmpty) {
                       CommonWidget.getToast(string.enter_confirm_password);
                       return;
                     } else if (_confirm_password.text.trim() != _password.text.trim()) {
                       CommonWidget.getToast(string.password_not_match);
                       return;
                     } else  {
                       CommonWidget.getToast("Success");
                     }
                   }),
             ),
             const SizedBox(height: 30),
             Container(
                   child: Text(
                    string.or_using_social_media,
                     style: TextStyle(
                         fontSize: 13,
                         fontWeight: FontWeight.normal,
                         color: getColorFromHex(ColorCode.Color_darkblue)),
                   ),
                   alignment: Alignment.center,

               ),
             const SizedBox(height: 18),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Image.asset(
                   facebook,
                   width: 40,
                   height: 40,
                   fit: BoxFit.cover,
                 ),
               ),
               Image.asset(
                 twitter,
                 width: 40,
                 height: 40,
                 fit: BoxFit.cover,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Image.asset(
                   google,
                   width: 40,
                   height: 40,
                   fit: BoxFit.cover,
                 ),
               ),
               Image.asset(
                 linkedin,
                 width: 40,
                 height: 40,
                 fit: BoxFit.cover,
               ),
             ],)
           ],),
              ),),




            ],
          ))),

    Align(
    alignment: Alignment.bottomCenter,
    child:
    Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    child: Text(
    string.already_have_an_acciunt,
    style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: getColorFromHex(ColorCode.Color_White)),
    ),
    ),

      Container( child:InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SigninScreen()),
            );
           // Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: SigninScreen()));
          },


    child: Text(
    string.signin,
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: getColorFromHex(ColorCode.Color_White)),
    ),
    ),),
    ],
    ),),

    )
        ],
      ),

      )
    );
  }
}

