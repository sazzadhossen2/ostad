
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Addnewitem extends StatefulWidget {
   Addnewitem({super.key});
  @override
  State<Addnewitem> createState() => _AddnewitemState();
}

class _AddnewitemState extends State<Addnewitem> {
   TextEditingController _productcodetext =TextEditingController();
   TextEditingController _productname =TextEditingController();
   TextEditingController _quentatytext =TextEditingController();
   TextEditingController _totalpricetext =TextEditingController();
   TextEditingController _pricetext =TextEditingController();
bool addinprogress=false;
   final GlobalKey<FormState> _fromkey=GlobalKey<FormState>();
   Future<void>addproduct()async{
     addinprogress =true;
     setState(() {
     });
     final responce =await http.post(Uri.parse(
     "https://crud.teamrabbil.com/api/v1/CreateProduct"),
     headers: {
       'Content-Type':'application/json'
     },
     body:jsonEncode({
           "Img":"",
           "ProductCode":_productcodetext.text.trim(),
           "ProductName":_productname.text.trim(),
           "Qty":_quentatytext.text.trim(),
           "TotalPrice":_totalpricetext.text.trim(),
           "UnitPrice":_pricetext.text.trim()
         }
     )
     );
     if(responce.statusCode==200){
       _productcodetext.clear();
       _productname.clear();
       _quentatytext.clear();
       _totalpricetext.clear();
       _pricetext.clear();
     }
     addinprogress=false;
     setState(() {

     });
     // print(responce.request!.url);
     // print(responce.statusCode);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Product"),),
body: SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child:addinprogress? Center(child: CupertinoActivityIndicator()): SingleChildScrollView(
      child: Form(
        key: _fromkey,
        child: Column(
          children: [

            TextFormField(
              controller: _productcodetext,
              decoration: InputDecoration(
                  hintText: "product code"
              ),validator: isValidate,
            ),
            TextFormField(
              controller: _productname,
              decoration: InputDecoration(hintText: "product name"),
              validator: isValidate,
            ),

            TextFormField(
              controller: _quentatytext,
              decoration: InputDecoration(
                  hintText: "quantati text"
              ),
              validator: isValidate,
            ),
            TextFormField(
              controller: _totalpricetext,
              decoration: InputDecoration(
                  hintText: "total price"
              ),
              validator: isValidate,
            ),
            TextFormField(
              controller: _pricetext,
              decoration: InputDecoration(
                  hintText: "Price"
              ),
              validator: isValidate,
            ),
            SizedBox(height: 20,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if(_fromkey.currentState!.validate()){
                    addproduct();
                  }
                }, child: Text("Add")))
          ],
        ),
      ),
    ),
  ),
),
    );
  }
   String? isValidate(String? value) {
     if (value?.trim().isNotEmpty ?? false) {
       return null;
     }
     return 'Enter valid value';
   }

   @override
   void dispose(){
     _pricetext.dispose();
     _totalpricetext.dispose();
     _quentatytext.dispose();
     _productname.dispose();
     _productcodetext.dispose();
   }
}

