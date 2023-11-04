//
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Addnewitem extends StatelessWidget {
//   Addnewitem({super.key});
//
//   TextEditingController _productcodetext = TextEditingController();
//   TextEditingController _productname = TextEditingController();
//   TextEditingController _quentatytext = TextEditingController();
//   TextEditingController _totalpricetext = TextEditingController();
//   TextEditingController _pricetext = TextEditingController();
//
//   final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
//
//   Future<void> addproduct() async {
//     final responce = await http.post(Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct"),
//         headers: {
//           'Content-Type': 'application/json'
//         },
//         body: jsonEncode({
//           "Img": "",
//           "ProductCode": _productcodetext.text,
//           "ProductName": _productname.text,
//           "Qty": _quentatytext.text,
//           "TotalPrice": _totalpricetext.text,
//           "UnitPrice": _pricetext.text
//         }));
//
//     print(responce.request!.url);
//     print(responce.statusCode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add new Product"),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _fromkey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _productcodetext,
//                     decoration: InputDecoration(hintText: "product code"),
//                     validator: isValidate,
//                   ),
//                   TextFormField(
//                     controller: _productname,
//                     decoration: InputDecoration(hintText: "product name"),
//                     validator: isValidate,
//                   ),
//                   TextFormField(
//                     controller: _quentatytext,
//                     decoration: InputDecoration(hintText: "quantati text"),
//                     validator: isValidate,
//                   ),
//                   TextFormField(
//                     controller: _totalpricetext,
//                     decoration: InputDecoration(hintText: "total price"),
//                     validator: isValidate,
//                   ),
//                   TextFormField(
//                     controller: _pricetext,
//                     decoration: InputDecoration(hintText: "Price"),
//                     validator: isValidate,
//                   ),
//                   SizedBox(height: 20,),
//                   SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                           onPressed: () {
//                             if (_fromkey.currentState!.validate()) {
//                               addproduct();
//                             }
//                           },
//                           child: Text("Add")))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String? isValidate(String? value) {
//     if (value
//         ?.trim()
//         .isNotEmpty ?? false) {
//       return null;
//     }
//     return "enter";
//   }
//
//   @override
//   void dispose(){
//
//     //  _imagetext.dispose();
//     _pricetext.dispose();
//     _totalpricetext.dispose();
//     _quentatytext.dispose();
//     _productname.dispose();
//     _productcodetext.dispose();
//   }
//
// }