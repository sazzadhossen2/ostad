
import 'dart:core';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad/screen/add_to_newproduct.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> productlist=[];
  bool inProgress =false;
@override
  void initState(){
  getProductlist();
  super.initState();
}
  void getProductlist()async{
  productlist.clear();
  inProgress=true;
  setState(() {

  });
    Response response =await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
if(response.statusCode==200){
final Map<String ,dynamic>responseData=jsonDecode(response.body);
if(responseData['status']=='success'){
  for(Map<String,dynamic> productJson in responseData['data']){
productlist.add(Product(
    productJson['_id'],
    productJson['ProductName'],
    productJson['ProductCode'],
    productJson['Img'],
    productJson['UnitPrice'],
    productJson['Qty'],
    productJson['TotalPrice'],
));
  }
}
}
inProgress=false;
print(productlist.length);
setState(() {
});
}
  void deletproducttlist(int index)async{

    inProgress=true;
    setState(() {

    });
    Response response =await get(Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/${productlist[index]!.id}"));
    if(response.statusCode==200){
      getProductlist();
    }else{
      inProgress=false;
      print(productlist.length);
      setState(() {
      });
    }

  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Apps"),
      actions: [
        IconButton(onPressed: (){
          getProductlist();

    }, icon: Icon(Icons.refresh))

      ],),
body:inProgress ?Center(child: CircularProgressIndicator()): ListView.builder(
itemCount: productlist.length,
    itemBuilder: (context,index){
  return
    ListTile(
      onTap: (){
        showDialog(context: context, builder:(context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Edit"),
                  leading: Icon(Icons.add),
                  onTap: (){
                    Navigator.pop(context);
Navigator.push(context, MaterialPageRoute(builder: (context){
  return Addnewproduct(product: productlist[index], );
}));
                  },
                ),
                Divider(height: 0,),
                ListTile(
                  onTap: (){
                    Navigator.pop(context);
                    deletproducttlist(index);
                  },
                  title: Text("Delet"),
                  leading: Icon(Icons.delete),
                )
              ],
            ),
          );
        });
      },
leading: Image.network(
  productlist[index].Image
),
    title: Text(productlist[index].ProductCode.toString()),
    subtitle: Column(
      children: [
        Text('product list${productlist[index].ProductCode.toString()}'),
        Text("quantity${productlist[index].quantity.toString()}"),
        Text("product price${productlist[index].totalprice.toString()}")
      ],
    ),
    trailing: Text(productlist[index].unitpRice),
  );

}),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Addnewproduct();
          }));
        },
        child: Icon(Icons.add),
      ),

    );
  }

}

class Product{
final  String id;
final  String ProductName;
final  String ProductCode;
final  String Image;
final  String unitpRice;
final  String quantity;
final  String totalprice;
Product(this.id, this.ProductName, this.ProductCode, this.Image, this.unitpRice, this.quantity, this.totalprice);

}





//
// import 'dart:core';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:ostad/screen/add_to_newproduct.dart';
//
// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   List<Product> productlist = [];
//   bool inProgress = false;
//
//   @override
//   void initState() {
//     getProductList();
//     super.initState();
//   }
//
//   // Changed the method name to follow Dart naming conventions
//   void getProductList() async {
//     productlist.clear();
//     inProgress = true;
//     setState(() {});
//
//     Response response =
//     await get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       if (responseData['status'] == 'success') {
//         for (Map<String, dynamic> productJson in responseData['data']) {
//           productlist.add(Product(
//             productJson['_id'],
//             productJson['ProductName'],
//             productJson['ProductCode'],
//             productJson['Img'],
//             productJson['UnitPrice'],
//             productJson['Qty'],
//             productJson['TotalPrice'],
//           ));
//         }
//       }
//     }
//     inProgress = false;
//     setState(() {});
//   }
//
//   // Fixed the parameter issue by adding an 'index' parameter
//   void deleteProductList(int index) async {
//     inProgress = true;
//     setState(() {});
//
//     Response response = await get(
//         Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/${productlist[index].id}"));
//
//     if (response.statusCode == 200) {
//       getProductList();
//     } else {
//       inProgress = false;
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Apps"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               getProductList();
//             },
//             icon: Icon(Icons.refresh),
//           )
//         ],
//       ),
//       body: inProgress
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: productlist.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         ListTile(
//                           title: Text("Edit"),
//                           leading: Icon(Icons.add),
//                           onTap: () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   return Addnewproduct(product: productlist[index]);
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                         Divider(height: 0),
//                         ListTile(
//                           onTap: () {
//                             // Pass the index to the deleteProductList method
//                             Navigator.pop(context);
//                             deleteProductList(index);
//                           },
//                           title: Text("Delete"),
//                           leading: Icon(Icons.delete),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             leading: Image.network(
//               productlist[index].Image,
//             ),
//             title: Text(productlist[index].ProductCode.toString()),
//             subtitle: Column(
//               children: [
//                 Text('product list ${productlist[index].ProductCode.toString()}'),
//                 Text("quantity ${productlist[index].quantity.toString()}"),
//                 Text("product price ${productlist[index].totalprice.toString()}")
//               ],
//             ),
//             trailing: Text(productlist[index].unitPrice),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) {
//                 return Addnewproduct();
//               },
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class Product {
//   final String id;
//   final String ProductName;
//   final String ProductCode;
//   final String Image;
//   final String unitPrice; // Fixed the variable name to follow Dart naming conventions
//   final String quantity;
//   final String totalprice;
//
//   Product(this.id, this.ProductName, this.ProductCode, this.Image, this.unitPrice, this.quantity, this.totalprice);
// }
//
//
