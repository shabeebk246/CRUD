import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/main.dart';
import 'package:crud/otp&number/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class phoneNumber extends StatefulWidget {
  const phoneNumber({super.key});

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

class _phoneNumberState extends State<phoneNumber> {
  TextEditingController numbercontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        title: Text("Enter Phone Number",
        style: TextStyle(
          color: colorconst.text,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        ),
        elevation: width*0,
        iconTheme: IconThemeData(color: colorconst.text),
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: Container(
          height: height*1,
          width: width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(imageconst.phone),
                  SizedBox(height: width*0.05,),
                  Container(
                    height: width*0.15,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                    ),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: numbercontroller,
                      style: TextStyle(
                          color: colorconst.content
                      ),
                      decoration: InputDecoration(
                          prefixIcon:CountryCodePicker(
                              initialSelection: 'IN',
                              favorite: ['+91','IN'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            showDropDownButton: true,
                          ),
                          enabledBorder:OutlineInputBorder(
                              borderSide:BorderSide(
                                  color: colorconst.login
                              ),
                              borderRadius:BorderRadius.circular(width*0.03)
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colorconst.login
                              ),
                              borderRadius:BorderRadius.circular(width*0.03)
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: width*0.05,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) =>otpVerification(),));
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
                        child: Text("Send OTP",
                          style: TextStyle(
                              color: colorconst.login,
                              fontSize: width*0.042,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign in with ",
                  style: TextStyle(
                    color: colorconst.text,
                    fontWeight: FontWeight.w500,
                    fontSize: width*0.034
                  ),
                  ),
                  Text("Another Method ?",
                  style: TextStyle(
                    fontSize: width*0.034,
                    fontWeight: FontWeight.w600,
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
