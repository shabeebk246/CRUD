import 'dart:convert';

import 'package:crud/constants/color_constants.dart';
import 'package:crud/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class aPi extends StatefulWidget {
  const aPi({super.key});

  @override
  State<aPi> createState() => _aPiState();
}

class _aPiState extends State<aPi> {
  String apiData = '' ;
  List apiDecoded =[];
  List postOffice = [];

  getApiData() async {
    http.Response data = await http.get(Uri.tryParse('https://api.postalpincode.in/pincode/${numbercontroller.text}')!);

    apiData= data.body;
    apiDecoded = jsonDecode(apiData);
    postOffice = apiDecoded[0]['PostOffice'];



    setState(() {

    });
  }

  TextEditingController numbercontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorconst.background,
      appBar: AppBar(
        backgroundColor: colorconst.background,
        iconTheme: IconThemeData(color: colorconst.text),
        elevation: width*0,
        centerTitle: true,
        title: Text("Postal Codes",
        style: TextStyle(
          color: colorconst.text,
          fontSize: width*0.05,
          fontWeight: FontWeight.w500
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width*0.04),
          child: Container(
            height: height*1,
            width: width*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: width*0.15,
                  width: width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    color: colorconst.container2
                  ),
                   child: TextFormField(
                     textInputAction: TextInputAction.done,
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     keyboardType: TextInputType.number,
                     controller: numbercontroller,
                     style: TextStyle(
                       color: colorconst.text
                     ),
                     decoration: InputDecoration(
                       prefixIcon: Icon(CupertinoIcons.search,color: colorconst.cancel,),
                       suffixIcon: ElevatedButton(
                           onPressed: () {
                             getApiData();
                           },
                           child: Text("Get")
                       ),
                       labelText: "Enter pincode",
                       labelStyle: TextStyle(
                         color: colorconst.text,
                         fontWeight: FontWeight.w500,
                         fontSize: width*0.038
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(width*0.03),
                         borderSide: BorderSide(color: colorconst.container2)
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: colorconst.container2),
                         borderRadius: BorderRadius.circular(width*0.03)
                       )
                     ),
                   ),
                ),
                SizedBox(height: width*0.03,),


                // Padding(
                //   padding: EdgeInsets.all(width*0.03),
                //   child: Text(postOffice.toString()),
                // ),
                Expanded(
                  child: ListView.separated(

                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) { 
                      return Container(
                        height: width*0.17,
                        width: width*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03),
                            color: colorconst.container2
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: width*0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Postoffice : "),
                                 Text(postOffice[index]['Name'])
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Pincode : "),
                                  Text(postOffice[index]['Pincode'])
                                ],
                              ),
                              Row(
                                children: [
                                  Text("District : "),
                                  Text(postOffice[index]['District'])
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) { 
                      return SizedBox(height: width*0.03,);
                   }, itemCount:postOffice.length
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
