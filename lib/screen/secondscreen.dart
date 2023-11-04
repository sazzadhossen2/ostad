
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apihit/apihit.dart';

class Secondscreen extends StatelessWidget {
  const Secondscreen({super.key});

  Future<Apihit>getapi()async{
    final resoonce =await http.get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
    var data = jsonDecode(resoonce.body.toString());
    if(resoonce.statusCode==200){
      return Apihit.fromJson(data);
    }
    else{
      return Apihit.fromJson(data);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Apihit>(future: getapi(),
          builder: (context,snapshot){
        if(!snapshot.hasData){
          return CupertinoActivityIndicator();
        }
        else{
          return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListTile(
                leading:Image.network(snapshot.data!.data![index].img.toString()),
                title: Text(snapshot.data!.data![index].productName.toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" ${snapshot.data!.data![index].productCode.toString()}"),
                    //Text("Total price ${snapshot.data!.data![index].totalPrice.toString()}"),
                  ],
                ),
                trailing: Text("${snapshot.data!.data![index].qty.toString()}"),
              ),
            );
          });
        }
          }

      ),
    );
  }
}
