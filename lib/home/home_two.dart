import 'package:crud/constants/color_constants.dart';
import 'package:crud/constants/image_constant.dart';
import 'package:crud/home/add_user.dart';
import 'package:crud/home/edit_user.dart';
import 'package:crud/home/profile.dart';
import 'package:crud/login/login_first.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homeTwo extends StatefulWidget {
  const homeTwo({super.key});

  @override
  State<homeTwo> createState() => _homeTwoState();
}

class _homeTwoState extends State<homeTwo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        elevation: width*0,
        automaticallyImplyLeading: false,
        title: Text("Hello, User",
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
              setState(() {

              });
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(imageconst.profile),
              radius: width*0.08,
            ),
          ),
          SizedBox(width:width*0.03),
          InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => firstLogin(),));
                setState(() {

                });
              },
              child: Icon(Icons.logout_rounded,color: colorconst.text,size: width*0.1,)),
          SizedBox(width:width*0.03)
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => addUser(),));
        },
        child: Icon(Icons.add),
        backgroundColor: colorconst.login,
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: Container(
          height: height*1,
          width: width*1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Users",
              style: TextStyle(
                color: colorconst.text,
                fontWeight: FontWeight.w500,
                fontSize: width*0.046
              ),
              ),
              SizedBox(height: width*0.03,),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: width*0.2,
                      width: width*1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: colorconst.list
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: colorconst.background,
                            radius: width*0.09,
                            backgroundImage: AssetImage(imageconst.boy),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Albert Flores",
                                style: TextStyle(
                                    color: colorconst.text,
                                    fontSize: width*0.032,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text("1901 Thornridge Cir. Shiloh, Hawaii",
                                style: TextStyle(
                                    color: colorconst.text,
                                    fontSize: width*0.032,
                                    fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          ),

                          InkWell(
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return     CupertinoAlertDialog(

                                        title: Text("Are you Sure\n You Want to delete User ?"),
                                        actions: [
                                          CupertinoDialogAction(

                                            isDestructiveAction: true,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:  Text('Yes'),
                                          ),
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child:  Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },);

                                setState(() {

                                });
                              },
                              child: Container(child: Icon(CupertinoIcons.delete,color: colorconst.logout,))),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => editUser(),));
                                setState(() {
                                  
                                });
                              },
                              child: SvgPicture.asset(imageconst.pen,width: width*0.06,))
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(height: width*0.03,);
                }, itemCount: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
