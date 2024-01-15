import 'dart:io';

import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addUser extends StatefulWidget {
  const addUser({super.key});

  @override
  State<addUser> createState() => _addUserState();
}

class _addUserState extends State<addUser> {

  var file;
  pickimage(ImageSource)async{
    final imgFile=await
    ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imgFile!.path);
    if(mounted){
      setState(() {
        file=File(imgFile.path);
      });
    }
    Navigator.pop(context);
  }
  bool visble=true;
  bool visble1=true;
  bool passval=false;

  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  final passwordvalidation=RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        elevation: width*0,
        iconTheme: IconThemeData(color: colorconst.text),
        centerTitle: true,
        title: Text("Add User",
        style: TextStyle(
          color: colorconst.text,
          fontWeight: FontWeight.w500,
          fontSize: width*0.05
        ),
        ),
      ),
      body: Padding(
        padding:EdgeInsets.all(width*0.04),
        child: Container(
          height: height*1,
          width: width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  file==null ? CircleAvatar(
                    backgroundImage:AssetImage(imageconst.profile),
                    radius: width*0.2,
                  ):CircleAvatar(
                    radius: width*0.2,
                    backgroundImage: FileImage(file),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width*0.28,top: width*0.3),
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoActionSheet(
                              message: Text("Choose a File From ?",),
                              actions: [
                                CupertinoActionSheetAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      pickimage(ImageSource.gallery);
                                    },
                                    child: Text("Photo Gallery")
                                ),
                                CupertinoActionSheetAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      pickimage(ImageSource.camera);
                                    },
                                    child: Text("Camera")
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")
                              ),
                            );
                          },
                        );
                      },
                      child: Image.asset(imageconst.edit,
                        height: width*0.1,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: width*0.15,
                width: width*1,
                decoration: BoxDecoration(
                  color:colorconst.container,
                  borderRadius: BorderRadius.circular(width*0.03),
                  // border: Border.all(color: Colors.transparent)
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: namecontroller,
                  style: TextStyle(
                      color: colorconst.content
                  ),
                  decoration: InputDecoration(
                      suffixIcon: Icon(CupertinoIcons.person,
                        color: colorconst.content,
                      ),
                      labelText: "Full name",
                      labelStyle: TextStyle(
                          color: colorconst.content,
                          fontWeight: FontWeight.w300,
                          fontSize:width*0.034
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: colorconst.container)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorconst.container),
                          borderRadius: BorderRadius.circular(width*0.03)
                      )
                  ),
                ),
              ),
              Container(
                height: width*0.15,
                width: width*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    color: colorconst.container
                ),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: emailcontroller,
                  style: TextStyle(
                      color: colorconst.content
                  ),
                  decoration: InputDecoration(
                      suffixIcon:Icon(Icons.email_outlined,color: colorconst.content,),
                      labelText: "Valid email",
                      labelStyle: TextStyle(
                          color: colorconst.content,
                          fontWeight: FontWeight.w300,
                          fontSize: width*0.034
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: colorconst.container)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorconst.container),
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
                    color: colorconst.container
                  // border: Border.all(color:passval==true ? colorconst.logout : colorconst.login)
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordcontroller,
                  obscuringCharacter: "*",
                  obscureText: visble1 ? true :false,
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
                            visble1=!visble1;
                            setState(() {

                            });
                          },
                          child: Icon(visble1 ? CupertinoIcons.lock :CupertinoIcons.lock_open,
                            color: colorconst.text,
                          )
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: colorconst.text,
                          fontSize:  width*0.034
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: passval==true ? colorconst.logout : colorconst.container)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color:passval==true ? colorconst.logout : colorconst.container, )
                      )
                  ),
                ),
              ),
              Container(
                height: width*0.15,
                width: width*0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    color: colorconst.container
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
                          child: Icon(visble ? CupertinoIcons.lock :CupertinoIcons.lock_open,
                            color: colorconst.text,
                          )
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: colorconst.text,
                          fontSize:  width*0.034
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: passval==true ? colorconst.logout : colorconst.container)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color:passval==true ? colorconst.logout : colorconst.container, )
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                    child: Text("Add User",
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
        ),
      ),
    );
  }
}
