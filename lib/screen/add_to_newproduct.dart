
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad/homepage.dart';

class Addnewproduct extends StatefulWidget {
  final Product?product;
 // final Function(String)onpressdelet;
  Addnewproduct({super.key, this.product,
    //required this.onpressdelet
  });

  @override
  State<Addnewproduct> createState() => _AddnewproductState();
}

class _AddnewproductState extends State<Addnewproduct> {
  final TextEditingController _imageTexteditingcontroller = TextEditingController();
  final TextEditingController _productcodeTexteditingcontroller = TextEditingController();
  final TextEditingController _productNameTexteditingcontroller = TextEditingController();
  final TextEditingController _quentityeditingcontroller = TextEditingController();
  final TextEditingController _totalpriceTexteditingcontroller = TextEditingController();
  final TextEditingController _priceTexteditingcontroller = TextEditingController();
  
  final GlobalKey<FormState>_formkey =GlobalKey<FormState>();
  bool addInprogress =false;
  Future<void> addNewProduct() async {
    addInprogress=true;
    setState(() {});
    final Map<String, String> inputMap = {
      "Img": _imageTexteditingcontroller.text.trim(),
      "ProductCode": _productcodeTexteditingcontroller.text.trim(),
      "ProductName": _productNameTexteditingcontroller.text.trim(),
      "Qty": _quentityeditingcontroller.text.trim(),
      "TotalPrice": _totalpriceTexteditingcontroller.text.trim(),
      "UnitPrice": _priceTexteditingcontroller.text.trim(),
    };

    final Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
        headers: {
          'Content-Type' : 'application/json',
        },
        body: jsonEncode(inputMap)
    );
if(response.statusCode==200){
  _priceTexteditingcontroller.clear();
  _totalpriceTexteditingcontroller.clear();
  _quentityeditingcontroller.clear();
  _productNameTexteditingcontroller.clear();
  _productcodeTexteditingcontroller.clear();
  _imageTexteditingcontroller.clear();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("product has bbenn  addad")));

}else if(response.statusCode==400){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("product coud be unique")));
}
    addInprogress = false;
     setState(() {});
  }
  Future<void> updateNewProduct() async {
    addInprogress=true;
    setState(() {});
    final Map<String, String> inputMap = {
      "Img": _imageTexteditingcontroller.text.trim(),
      "ProductCode": _productcodeTexteditingcontroller.text.trim(),
      "ProductName": _productNameTexteditingcontroller.text.trim(),
      "Qty": _quentityeditingcontroller.text.trim(),
      "TotalPrice": _totalpriceTexteditingcontroller.text.trim(),
      "UnitPrice": _priceTexteditingcontroller.text.trim(),
    };

    final Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product!.id}'),
        headers: {
          'Content-Type' : 'application/json',
        },
        body: jsonEncode(inputMap)
    );
    if(response.statusCode==200){
      _priceTexteditingcontroller.clear();
      _totalpriceTexteditingcontroller.clear();
      _quentityeditingcontroller.clear();
      _productNameTexteditingcontroller.clear();
      _productcodeTexteditingcontroller.clear();
      _imageTexteditingcontroller.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("product has bbenn  updated")));

    }else if(response.statusCode==400){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("product coud be unique")));
    }
    addInprogress = false;
    setState(() {});
  }
  @override
  void initState() {
    if(widget.product!=null){
      _imageTexteditingcontroller.text=widget.product!.Image;
      _productcodeTexteditingcontroller.text=widget.product!.ProductCode;
      _productNameTexteditingcontroller.text=widget.product!.ProductName;
      _quentityeditingcontroller.text=widget.product!.quantity;
      _totalpriceTexteditingcontroller.text=widget.product!.totalprice;
      _priceTexteditingcontroller.text=widget.product!.unitpRice;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add"),),
      body: Form(
key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller:_imageTexteditingcontroller ,
              decoration:  InputDecoration(
                label: Text('image'),
                hintText: 'iamge'
              ),
              validator: isValidate,
            ),
            TextFormField(
              controller:_productcodeTexteditingcontroller ,
              decoration:  InputDecoration(
                  label: Text('product code'),
                  hintText: 'enter product code'
              ),
              validator: isValidate,
            ),
            TextFormField(
              controller:_productNameTexteditingcontroller ,
              decoration:  InputDecoration(
                  label: Text('product name'),
                  hintText: 'enter product name'
              ),
              validator: isValidate,
            ),
            TextFormField(
              controller: _quentityeditingcontroller,
              decoration:  InputDecoration(
                  label: Text('quentity'),
                  hintText: 'enter quentity'
              ),
              validator: isValidate,
            ),
            TextFormField(
              controller: _totalpriceTexteditingcontroller,
              decoration:  InputDecoration(
                  label: Text('totral'),
                  hintText: 'enter total product'
              ),
              validator: isValidate,
            ),

            TextFormField(
              controller:_priceTexteditingcontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Price'),
                hintText: 'Enter product price',
              ),
              validator: isValidate,
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child:addInprogress?Center(child: CircularProgressIndicator()):ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                      if(widget.product==null){
                        addNewProduct();
                      }
                      else{
                        updateNewProduct();
                      }
                    }
              },
                  child:widget.product !=null?Text("Update") :Text("Add")),
            )
          ],
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
    super.dispose();
    _productNameTexteditingcontroller.dispose();
    _priceTexteditingcontroller.dispose();
    _totalpriceTexteditingcontroller.dispose();
    _quentityeditingcontroller.dispose();
    _productcodeTexteditingcontroller.dispose();
    _imageTexteditingcontroller.dispose();
  }
}
