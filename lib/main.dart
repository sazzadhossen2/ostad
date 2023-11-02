import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad/homepage.dart';

void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget {
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Example3(),
    );
  }
}


