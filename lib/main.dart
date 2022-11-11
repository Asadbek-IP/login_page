import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/pages/login_page.dart';
import 'package:login_page/services/shared_pref.dart';

void main(){
runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin;
  
  login()async{
    SharedPref.getLogin().then((value) {
      setState(() {
        isLogin = value;
      });
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: isLogin ==null? LoginPage():HomePage(),
    );
  }
}