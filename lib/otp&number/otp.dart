import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/home/home_one.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class otpVerification extends StatefulWidget {
  const otpVerification({super.key});

  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        elevation: width*0,
        iconTheme: IconThemeData(color: colorconst.text),
        title: Text("Verify OTP",
        style: TextStyle(
          color: colorconst.text,
          fontWeight: FontWeight.w500,
          fontSize: width*0.05
        ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.04),
        child: Container(
          height: height*1,
          width: width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: width*1.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(imageconst.otp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("OTP has been sent to",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colorconst.content
                        ),
                        ),
                        Text(" *****634",
                        style: TextStyle(
                          color: colorconst.login,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                        ),
                        ),
                        SvgPicture.asset(imageconst.pen,width: width*0.05,),
                      ],
                    ),
                    Pinput(
                      length: 6,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => homeOne(),));
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
                          child: Text("Verify",
                            style: TextStyle(
                                color: colorconst.login,
                                fontSize: width*0.042,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Haven't got the confirmation code yet? ",
                        style: TextStyle(
                          color: colorconst.text,
                          fontSize: width*0.032,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                        Text("Resend",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width*0.032,
                          color: colorconst.login
                        ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Try Another",
                  style: TextStyle(
                    color: colorconst.text,
                    fontSize: width*0.032,
                    fontWeight: FontWeight.w400
                  ),
                  ),
                  Text(" Method?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: width*0.032,
                    color: colorconst.login
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
