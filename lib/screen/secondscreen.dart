
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad/screen/Home_screen.dart';

class Scondscrren extends StatelessWidget {
 final Photolist datapass;
  Scondscrren(  this.datapass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api cheek"),),
      body: Column(
        children: [
 Image(image: NetworkImage(datapass.url.toString())),
        
        Text(datapass.title.toString())
        ],
      ),
    );
  }
}
