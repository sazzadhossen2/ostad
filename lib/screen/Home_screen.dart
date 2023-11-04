
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:ostad/screen/secondscreen.dart';
import '../apiscreen/apicolling.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
  List<Apicolling> postlist = [];
  Future<List<Apicolling>> getApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postlist.add(Apicolling.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getApi(),
        builder: (context, snapshot){
            if (!snapshot.hasData) {
              return const  Center(
                child: CupertinoActivityIndicator(),
              );
            }
          else {
            return  ListView.builder(

              itemCount: postlist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Scondscrren(postlist[index]);
                    }));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(postlist[index].url.toString()),
                    ),
                    title: Text(postlist[index].title.toString()),
                    subtitle: Text(postlist[index].id.toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}




