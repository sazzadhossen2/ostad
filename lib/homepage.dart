
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ostad/screen/apihit.dart';
import 'package:ostad/screen/apihit2.dart';
import 'package:ostad/screen/apihit3.dart';
import 'package:ostad/showingpage.dart';


class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Examole3State();
}

class _Examole3State extends State<Example3> {
  List<Apihit3> adduser=[];
  Future<List<Apihit3>>getadress()async{
    final responce=await http.get(Uri.parse("https://webhook.site/b85b808d-4182-4d47-b877-2cececc0f105"));
    var data = jsonDecode(responce.body.toString());
    if(responce.statusCode==200){
      for(Map<String ,dynamic>i in data){
        adduser.add(Apihit3.fromJson(i));
      }
      return adduser;
    }
    else {
      return adduser;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Apps"),),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(future:getadress() ,
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    else{
                      return ListView.builder(
                          itemCount: adduser.length,
                          itemBuilder: (context,index){
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  // onTap: (){
                                  //   Navigator.push(context,MaterialPageRoute(builder: (context){
                                  //     return Showingpage(adduser[index] );
                                  //   }));
                                  // },
                                  child: Column(
                                    children: [
                                      Reusablerow(value: adduser[index].city.toString()),
                                      Reusablerow( value: adduser[index].temperature.toString()),
                                      Reusablerow(value: adduser[index].condition.toString()),
                                      Reusablerow(value: adduser[index].condition.toString()),

                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        )
    );
  }
}

class Reusablerow extends StatelessWidget {
  String value;
  Reusablerow({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value)
          ],
        ),
      );
  }
}