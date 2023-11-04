
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:ostad/screen/secondscreen.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
  List<Photolist> postlist = [];
  Future<List<Photolist>> getApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        Photolist photolist=Photolist(title: i['title'], url:i ["url"]);
        postlist.add(photolist);
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
class Photolist{
  String title,url;
  Photolist({required this.title,required this.url});
}

