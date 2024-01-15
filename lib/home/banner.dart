import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class banner extends StatefulWidget {
  const banner({super.key});

  @override
  State<banner> createState() => _bannerState();
}

class _bannerState extends State<banner> {

  TextEditingController namecontroller=TextEditingController();

  List images=[
    {
      "image":imageconst.pic1,
      "text":"Banner 1"
    },
    {
     "image1":imageconst.pic2,
      "text1":"Banner 2"
    },
    {
      "image2":imageconst.pic3,
      "text2":"Banner 3"
    }
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        elevation: width*0,
        backgroundColor: colorconst.background,
        centerTitle: true,
        title: Text("Banner",
        style: TextStyle(
          color: colorconst.text,
          fontSize: width*0.05,
          fontWeight: FontWeight.w500
        ),
        ),
        iconTheme: IconThemeData(
          color: colorconst.text
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(width*0.05),
          child: Container(
            height: height*1,
            width: width*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imageconst.banner,),
                SizedBox(height: width*0.03,),
                Container(
                  height: width*0.15,
                  width: width*1,
                  decoration: BoxDecoration(
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
                        labelText: "Title",
                        labelStyle: TextStyle(
                            color: colorconst.content,
                            fontWeight: FontWeight.w300,
                            fontSize:width*0.034
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(color: colorconst.login)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorconst.login),
                            borderRadius: BorderRadius.circular(width*0.03)
                        )
                    ),
                  ),
                ),
                SizedBox(height: width*0.03,),
                Container(
                  height: width*0.13,
                  width: width*0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.3),
                      color: colorconst.background,
                      border: Border.all(color: colorconst.login,
                      )
                  ),
                  child: Center(
                    child: Text("Upload Banner",
                      style: TextStyle(
                          color: colorconst.login,
                          fontSize: width*0.04,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width*0.03,),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) { 
                      return  Container(
                        height: width*0.25,
                        width: width*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03),
                            color: colorconst.container2
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(imageconst.pic1,width: width*0.35,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Banner 1",
                                  style:TextStyle(
                                      color: colorconst.cancel,
                                      fontWeight: FontWeight.w400,
                                      fontSize: width*0.042
                                  ),
                                ),
                                Text("2 May",
                                  style:TextStyle(
                                      color: colorconst.text,
                                      fontWeight: FontWeight.w400,
                                      fontSize: width*0.036
                                  ),
                                )
                              ],
                            ),
                            Icon(CupertinoIcons.delete,color: colorconst.logout,)
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) { 
                      return SizedBox(height: width*0.03,);
                  }, itemCount: images.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
