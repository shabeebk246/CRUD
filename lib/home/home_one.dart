import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/home/api.dart';
import 'package:crud/home/banner.dart';
import 'package:crud/home/home_two.dart';
import 'package:crud/home/profile.dart';
import 'package:crud/login/login_first.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeOne extends StatefulWidget {
  const homeOne({super.key});

  @override
  State<homeOne> createState() => _homeOneState();
}

class _homeOneState extends State<homeOne> {
  List images=[
    imageconst.pic1,
    imageconst.pic2,
    imageconst.pic3
  ];
int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        elevation: width*0,
        automaticallyImplyLeading: false,
        title: Text("Hello,$username",
        style: TextStyle(
          color: colorconst.text,
          fontSize: width*0.05,
          fontWeight: FontWeight.w500
        ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => profile(),));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(imageconst.profile),
              radius: width*0.08,
            ),
          ),
          SizedBox(width:width*0.03),
          InkWell(
            onTap: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('login');
              prefs.clear();
              Navigator.push(context, CupertinoPageRoute(builder: (context) => firstLogin(),));
              setState(() {

              });
            },
              child: Icon(Icons.logout_rounded,color: colorconst.text,size: width*0.1,)),
          SizedBox(width:width*0.03)
        ],
      ),
      body: Container(
        height: height*1,
        width: width*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    height: width*0.5,
                    width: width*1,
                    margin: EdgeInsets.all(width*0.03),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      image:DecorationImage(image:AssetImage(images[index]),
                      fit: BoxFit.cover
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  onPageChanged:(index, reason) {
                    currentIndex=index;
                    setState(() {

                    });
                  },
                  autoPlay: true,
                  viewportFraction:0.9,
                    autoPlayAnimationDuration: Duration(
                      milliseconds:300,
                    )
                )
            ),
            AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: images.length,
              effect: ExpandingDotsEffect(
                dotColor: colorconst.content,
                activeDotColor: colorconst.text,
                  dotHeight: width*0.02,
                  dotWidth: width*0.03
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(width*0.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => homeTwo(),));
                          setState(() {

                          });
                        },
                        child: Container(
                          height: width*0.4,
                          width: width*0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.08),
                            color: colorconst.background,
                             boxShadow:[
                               BoxShadow(
                                 blurRadius: width*0.03,
                                 offset: Offset(0,4),
                                 spreadRadius: width*0.02,
                                 color: colorconst.text.withOpacity(0.15)
                               )
                             ]
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(imageconst.crud,width: width*0.2,),
                              Text("CRUD",
                              style: TextStyle(
                                color: colorconst.text,
                                fontWeight: FontWeight.w500,
                                fontSize: width*0.05
                              ),
                              )
                            ],
                          ) ,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => banner(),));
                          setState(() {

                          });
                        },
                        child: Container(
                          height: width*0.4,
                          width: width*0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.08),
                            color: colorconst.background,
                              boxShadow:[
                                BoxShadow(
                                    blurRadius: width*0.03,
                                    offset: Offset(0,4),
                                    spreadRadius: width*0.02,
                                    color: colorconst.text.withOpacity(0.15)
                                )
                              ]
                          ),
                          child: Image.asset(imageconst.crud1,width: width*0.32,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => aPi(),));
                        },
                        child: Container(
                          height: width*0.4,
                          width: width*0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.08),
                              color: colorconst.background,
                              boxShadow:[
                                BoxShadow(
                                    blurRadius: width*0.03,
                                    offset: Offset(0,4),
                                    spreadRadius: width*0.02,
                                    color: colorconst.text.withOpacity(0.15)
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(imageconst.crud2,width: width*0.25,),
                              Text("API",
                              style: TextStyle(
                                color: colorconst.text,
                                fontSize: width*0.05,
                                fontWeight: FontWeight.w500
                              ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
