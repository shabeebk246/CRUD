import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/login/login_second.dart';
import 'package:crud/signup/signup_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class firstLogin extends StatefulWidget {
  const firstLogin({super.key});

  @override
  State<firstLogin> createState() => _firstLoginState();
}

class _firstLoginState extends State<firstLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        elevation: width*1,
        backgroundColor: colorconst.background,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imageconst.img1,
          ),
          Text("CRUD",
            style: TextStyle(
              color: colorconst.login,
              fontWeight: FontWeight.w700,
              fontSize: width*0.072
            ),
          ),
          Text("Create, Read, Update ,Delete",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colorconst.login
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) =>secondLogin() ,));
              setState(() {

              });
            },
            child: Container(
              height: width*0.13,
              width: width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.3),
                color: colorconst.login
              ),
              child: Center(
                child: Text("Login",
                  style: TextStyle(
                    color: colorconst.background,
                    fontWeight: FontWeight.w700,
                    fontSize: width*0.042
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => firstSignup(),));
              setState(() {

              });
            },
            child: Container(
              height: width*0.13,
              width: width*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width*0.3),
                color: colorconst.background,
                border: Border.all(color: colorconst.login,
                width: width*0.005
                )
              ),
              child: Center(
                 child: Text("Sign up",
                   style: TextStyle(
                     color: colorconst.login,
                     fontSize: width*0.042,
                     fontWeight: FontWeight.w700
                   ),
                 ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
