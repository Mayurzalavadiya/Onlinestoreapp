import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onlinestoreapp/utils/constantKey.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiMethodName {
  //Note:- MultiPath api param change move particular multiPath api screen

  static Future<String> getUserLoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userLoginToken = "";

    if (prefs.containsKey(constantKey.user_login_token))
      userLoginToken = prefs.getString(constantKey.user_login_token)!;

    debugPrint("User Login Token----- " + userLoginToken);
    return userLoginToken;
  }

  static Future<http.Response> postMethodBodyParamToken(
      String UrlName, var body) async {
    String userLoginToken = await getUserLoginToken();

    final http.Response response = await http
        .post(
      Uri.parse(UrlName),
      headers: <String, String>{
        'vendor-secret-key': '43bf45dff31bf86475c46b40c0a0277e',
        'Authorization': 'Bearer $userLoginToken'
      },
      body: body,
    )
        .timeout(Duration(seconds: 300), onTimeout: () {
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    return response;
  }

  static Future<http.Response> postMethodWithToken(
    String UrlName,
  ) async {
    String userLoginToken = await getUserLoginToken();

    final http.Response response = await http.post(
      Uri.parse(UrlName),
      headers: <String, String>{
        'vendor-secret-key': '43bf45dff31bf86475c46b40c0a0277e',
        'Authorization': 'Bearer $userLoginToken'
      },
    ).timeout(Duration(seconds: 300), onTimeout: () {
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    return response;
  }

  static Future<http.Response> postMethodWithoutToken(
    String UrlName,
  ) async {
    final http.Response response = await http
        .post(Uri.parse(UrlName))
        .timeout(Duration(seconds: 300), onTimeout: () {
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    return response;
  }

  static Future<http.Response> postMethodBodyParamWithOutToken(
      String UrlName, var body) async {
    final http.Response response = await http
        .post(
      Uri.parse(UrlName),
      headers: <String, String>{
        'vendor-secret-key': '43bf45dff31bf86475c46b40c0a0277e',
      },
      body: body,
    )
        .timeout(Duration(seconds: 300), onTimeout: () {
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    return response;
  }

  static Future<http.Response> getMethodWithToken(String UrlName) async {
    String userLoginToken = await getUserLoginToken();

    final http.Response response = await http.get(
      Uri.parse(UrlName),
      headers: <String, String>{
        'vendor-secret-key': '43bf45dff31bf86475c46b40c0a0277e',
        'Authorization': 'Bearer $userLoginToken'
      },
    ).timeout(Duration(seconds: 300), onTimeout: () {
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    return response;
  }

  static Future<http.Response> getMethodWithoutToken(String UrlName) async {
    final http.Response response = await http
        .get(
      Uri.parse(UrlName),
    )
        .timeout(Duration(seconds: 300), onTimeout: () {
      return http.Response('Error', 500); // Replace 500 with your http code.
    });

    return response;
  }
}
