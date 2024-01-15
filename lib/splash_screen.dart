import 'package:crud/home/home_one.dart';
import 'package:crud/login/login_first.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {


  login()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool login = false;
    login = prefs.getBool('login')??false;
    username=prefs.getString("username");

    Future.delayed(
        Duration(
            seconds: 4
        )
    ).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) =>login?homeOne():firstLogin())));
  }


  @override
  void initState()
  {
    login();

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
