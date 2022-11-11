import 'dart:convert';

import 'package:login_page/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static void setUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    pref.setString("user", stringUser);
  }

  static Future<User> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = pref.getString("user")!;

    Map map = jsonDecode(user);

    return User.fromJson(map);
  }

  static void setLogin(bool isLogin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", isLogin);
  }

  static Future<bool?> getLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getBool("login");
  }
}
