import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/home/home_one.dart';
import 'package:crud/otp&number/phone.dart';
import 'package:crud/signup/signup_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../main.dart';

class secondLogin extends StatefulWidget {
  const secondLogin({super.key});

  @override
  State<secondLogin> createState() => _secondLoginState();
}

class _secondLoginState extends State<secondLogin> {
  bool visble=true;
  bool passval=false;

  final passwordvalidation=RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  TextEditingController namecontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();


setLogin()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('login', true);
  prefs.setString('username', namecontroller.text);
  Navigator.push(context, CupertinoPageRoute(builder: (context) => homeOne(),));

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        elevation: width*1,
        title: Text("CRUD",
        style: TextStyle(
          color: colorconst.text,
          fontWeight: FontWeight.w700,
          fontSize: width*0.056
        ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height*0.88,
          width: width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imageconst.img2),
              Container(
                height: width*0.15,
                width: width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  // border: Border.all(color: colorconst.login)
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: namecontroller,
                  style: TextStyle(
                    color: colorconst.text
                  ),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: colorconst.text,
                      fontSize: width*0.038
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:colorconst.login
                      ),
                      borderRadius: BorderRadius.circular(width*0.03)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorconst.login
                      ),
                      borderRadius: BorderRadius.circular(width*0.03)
                    )
                  ),
                ),
              ),
              Container(
                height: width*0.15,
                width: width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  // border: Border.all(color:passval==true ? colorconst.logout : colorconst.login)
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordcontroller,
                  obscuringCharacter: "*",
                  obscureText: visble ? true :false,
                  onChanged: (value) {
                    if(!passwordvalidation.hasMatch(value!))
                      {
                        passval = true;
                      }
                    else
                      {
                        passval =false;
                      }
                    setState(() {

                    });
                  },
                  style: TextStyle(
                      color: colorconst.text
                  ),
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        visble=!visble;
                        setState(() {

                        });
                      },
                        child: Icon(visble ? Icons.visibility_off :Icons.visibility,
                          color: colorconst.text,
                        )
                    ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: colorconst.text,
                          fontSize: width*0.038
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(color: passval==true ? colorconst.logout : colorconst.login)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width*0.03),
                      borderSide: BorderSide(color:passval==true ? colorconst.logout : colorconst.login, )
                    )
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                 setLogin();
                 username=namecontroller.text;


                },
                child: Container(
                  height: width*0.13,
                  width: width*0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.3),
                    border: Border.all(color: colorconst.login,width: width*0.005)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.lock_outlined,color: colorconst.login,),
                    title: Text("Login",
                    style: TextStyle(
                      color: colorconst.login,
                      fontWeight: FontWeight.w700,
                      fontSize: width*0.04
                    ),
                    ),
                  ),
                ),
              ),
              Container(
                height: width*0.13,
                width: width*0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.3),
                    border: Border.all(color: colorconst.login,width: width*0.005)
                ),
                child: ListTile(
                  leading:Image.asset(imageconst.google,width: width*0.08),
                  title: Text(" Sign in with Google",
                    style: TextStyle(
                        color: colorconst.login,
                        fontWeight: FontWeight.w700,
                        fontSize: width*0.04
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => phoneNumber(),));
                  setState(() {

                  });
                },
                child: Container(
                  height: width*0.13,
                  width: width*0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.3),
                      border: Border.all(color: colorconst.login,width: width*0.005)
                  ),
                  child: ListTile(
                    leading:Icon(CupertinoIcons.phone,color: colorconst.login,),
                    title: Text(" OTP sign in",
                      style: TextStyle(
                          color: colorconst.login,
                          fontWeight: FontWeight.w700,
                          fontSize: width*0.04
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account ? ",
                  style: TextStyle(
                    color: colorconst.login,
                    fontSize: width*0.03,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => firstSignup(),));
                      setState(() {

                      });
                    },
                    child: Text("Create Now",
                    style: TextStyle(
                      color: colorconst.login,
                      fontSize: width*0.03,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
