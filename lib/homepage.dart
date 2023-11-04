

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad/screen/apihit.dart';
import 'package:http/http.dart' as http;
import 'package:ostad/secondpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Apihit> adduser = [];

  Future<List<Apihit>> getApi() async {

      final response = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/photo"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List<dynamic>;
        for (Map<String, dynamic> item in data) {
          adduser.add(Apihit.fromJson(item));
        }
        return adduser;
      } else {

        print("Error");
        return adduser;


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo Gallary Apps"),),
      body: FutureBuilder(future: getApi(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(child: CupertinoActivityIndicator());
            }
            else{
              return ListView.builder(

                  itemCount: adduser.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Secondpage(adduser[index]);
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image(image: NetworkImage(adduser[index].url.toString()))),
                              SizedBox(width: 20,),
                              Expanded(
                                  flex:2,
                                  child: Text(adduser[index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold,),)),

                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
