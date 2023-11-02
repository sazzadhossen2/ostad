
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ostad/screen/apihit.dart';
// import 'package:ostad/showingpage.dart';
//
//
// class Showingpage extends StatelessWidget {
//   Showingpage({super.key});
//
//   List<Apihit> adduser=[];
//
//   Future<List<Apihit>>getadress()async{
//     final responce=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
//     var data = jsonDecode(responce.body.toString());
//     if(responce.statusCode==200){
//       for(Map<String ,dynamic>i in data){
//         adduser.add(Apihit.fromJson(i));
//       }
//       return adduser;
//     }
//     else {
//       return adduser;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("My Apps"),),
//         body: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder(future:getadress() ,
//                   builder: (context,snapshot){
//                     if(!snapshot.hasData){
//                       return CircularProgressIndicator();
//                     }
//                     else{
//                       return ListView.builder(
//                           itemCount: adduser.length,
//                           itemBuilder: (context,index){
//                             return Card(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: GestureDetector(
//                                   onTap: (){
//                                     Navigator.push(context,MaterialPageRoute(builder: (context){
//                                       return Showingpage(showpage: adduser[index].toString());
//                                     }));
//                                   },
//                                   child: Column(
//                                     children: [
//                                       Reusablerow(value: adduser[index].url.toString()),
//                                       Reusablerow( value: adduser[index].title.toString()),
//                                       Reusablerow(value: adduser[index].id.toString()),
//
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           });
//                     }
//                   }),
//             )
//           ],
//         )
//     );
//   }
// }
//
// class Reusablerow extends StatelessWidget {
//   String value;
//   Reusablerow({super.key, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(value)
//           ],
//         ),
//       );
//   }
// }