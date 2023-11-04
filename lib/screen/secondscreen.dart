
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ostad/screen/addnewitem.dart';
import 'package:ostad/screen/test.dart';
import '../apihit/apihit.dart';

class Secondscreen extends StatefulWidget {
  Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  List<Apihit>productlist=[];

  bool inprogress=true;

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

  Future<Apihit>getdeletapi(int index)async{

    final resoonce =await http.get(Uri.parse(
        "https://crud.teamrabbil.com/api/v1/DeleteProduct/639da5960817590a4e4fd53c"));
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
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){
          return Addnewitem();
        })); },
        child: Icon(Icons.add),
      ),
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
                onTap: (){
                  showDialog(context: context,builder:( context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
                          ),
                          Divider(height: 2,),
                          ListTile(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            leading: Icon(Icons.delete),
                            title: Text("Delet"),
                          )
                        ],
                      ),
                    );
                  });
                },
               // leading:Image.network(snapshot.data!.data![index].img.toString()),
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
